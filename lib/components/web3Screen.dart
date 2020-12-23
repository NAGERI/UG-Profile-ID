import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class Web3Screen extends StatefulWidget {
  static String id = 'Web3Screen_screen';

  @override
  _Web3ScreenState createState() => _Web3ScreenState();
}

class _Web3ScreenState extends State<Web3Screen> {
  bool data = false;
  Client httpClient;

  EthereumAddress _contractAddress;
  EthereumAddress _ownAddress;
  Web3Client ethClient;
  Credentials _credentials;
  final _rpcApiUrl = "http://10.103.14.38:7545";
  final _wsApiurl = "ws://10.103.14.38:7545";
  final _privateKey =
      "5e2fbf01ceff3867cb1dac4f52f62a949cddc422625447e8eb56e47b08b30130";

  String _abiCode;
  final accountAddress = "0x539eD935170D41B30D30754d8f6Ca8B798EDA895";
  var myData;
  var myJSONData;

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(_rpcApiUrl, httpClient, socketConnector: () {
      return IOWebSocketChannel.connect(_wsApiurl).cast<String>();
    });

    getImage(accountAddress);
    getJSONData();
  }

/*
 * Currently not being used, it helps deploying to the blockchain */
  Future<void> getCredentials() async {
    _credentials = await ethClient.credentialsFromPrivateKey(_privateKey);
    _ownAddress = await _credentials.extractAddress();
  }

  Future<DeployedContract> loadContract() async {
    // rootBundle from flutter Serices / getting Abi
    String abiStringFIle = await rootBundle.loadString("assets/abi.json");
    var jsonAbi = jsonDecode(abiStringFIle);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);

    final contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Document"), _contractAddress);
    return contract;
  }

// query depending on the method
  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    print("Done");
    return result;
  }

// fetching the document
  Future<void> getImage(String targetAddress) async {
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    List<dynamic> result = await query("getImage", []);

    myData = result[0];
    print("Document fetched..." + result[0]);
    data = true;
    setState(() {});
  }

  Future<void> getJSONData() async {
    List<dynamic> result = await query("getProfile", []);
    data = false;
    myJSONData = jsonDecode(result[0]);
    var country = myJSONData["nationality"];
    print("JSON data fetched...    $country");
    data = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      body: ZStack([
        VxBox()
            .blue400
            .size(context.screenWidth, context.percentHeight * 30)
            .make(),
        VStack([
          (context.percentHeight * 10).heightBox,
          "UG Profile ID".text.xl4.gray200.makeCentered().py16(),
          (context.percentHeight * 5).heightBox,
          VxBox(
                  child: VStack([
            "Name".text.gray700.xl2.semiBold.makeCentered(),
            10.heightBox,
            data
                ? "Admin".text.bold.sm.makeCentered()
                : CircularProgressIndicator().centered()
          ]))
              .p12
              .white
              .size(context.screenWidth, context.percentHeight * 18)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,
          HStack(
            [
              //similar to Row
              FlatButton.icon(
                onPressed: () => getJSONData(),
                color: Colors.blue,
                shape: Vx.roundedSm,
                icon: Icon(Icons.refresh_rounded, color: Colors.white),
                label: "Refresh".text.white.make(),
              ).h(50)
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p16(),
          VStack([
            // put in a while loop as waiting ofr network connection
            Image.network("https://ipfs.infura.io/ipfs/$myData",
                    cacheHeight: 100, cacheWidth: 100)
                .expand()
                .centered(),
            myJSONData.toString().text.sm.gray600.size(2).make().p12()
          ])
        ])
      ]),
    );
  }
}
