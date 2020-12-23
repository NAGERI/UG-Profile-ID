import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

EthereumAddress _contractAddress;
Web3Client ethClient;
final _rpcApiUrl = "http://10.103.9.149:7545";  
final _wsApiurl = "ws://10.103.9.149:7545";

final accountAddress = "0x4E75412E7E2eB789A68E9bca476170Eb3Ac35dc5";
var myData;
var myJSONData;
String _abiCode;

getConnection() {
  ethClient = Web3Client(_rpcApiUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(_wsApiurl).cast<String>();
  });
  print("connection setUp");
}
/*
Future<Post> fetchPost() async {
final response = await http.get('http://localhost:3000/Movies/1');
if (response.statusCode == 200) {
// If the call to the server was successful, parse the JSON
return Post.fromJson(json.decode(response.body));
} else {
// If that call was not successful, flag an error.
throw Exception('Failed to load post');
}
}*/

Future<DeployedContract> loadContract() async {
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

  return result;
}

Future<String> getImage() async {
  List<dynamic> result = await query("getImage", []);
  myData = result[0];
  return myData;
}

Future<dynamic> getJSONData() async {
  List<dynamic> result = await query("getProfile", []);
  myJSONData = jsonDecode(result[0]);
  print("the JSON data is here: $myJSONData");
  return jsonDecode(result[0]);
}
