import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugId/components/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'dart:convert';
import 'package:ugId/components/web3Functions.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  void initState() {
    super.initState();
    getConnection();
    getImage();
    getJSONData();
  }

  bool option = false;
  bool loading = false;

  bool _loadImage() {
    if (getImage() == null || myJSONData == null) {
      setState(() {
        loading = true;
      });
      return true;
    } else
      setState(() {
        loading = false;
      });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
          height: 500.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: option
                ? Center(child: getQR())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        // child: Image.asset('images/ona.png'),
                        backgroundImage: NetworkImage(
                            "https://ipfs.infura.io/ipfs/$myData"), // AssetImage('images/ona.png'),
                        radius: 70.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('SURNAME :  ', style: kTextFieldStyle),
                                Text('GIVEN NAME :  ', style: kTextFieldStyle),
                                Text('GENDER : ', style: kTextFieldStyle),
                                Text('DATE OF BIRTH : ',
                                    style: kTextFieldStyle),
                                Text('NATIONALITY : ', style: kTextFieldStyle),
                                Text('NIN : ', style: kTextFieldStyle),
                                // Text('DATE FOR RENEWAL : ',style: kTextFieldStyle),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(myJSONData["firstName"],
                                    style: kTextFieldStyle2),
                                Text(myJSONData["lastName"],
                                    style: kTextFieldStyle2),
                                Text('Male', style: kTextFieldStyle2),
                                Text(myJSONData["age"],
                                    style: kTextFieldStyle2),
                                Text(myJSONData["nationality"],
                                    style: kTextFieldStyle2),
                                Text(myJSONData["nin"].toUpperCase(),
                                    style: kTextFieldStyle2),
                                // Text('09-02-2025', style: kTextFieldStyle2),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        ),
        floatingActionButton: Theme(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                toggle();
              });
            },
            child: Icon(FontAwesomeIcons.qrcode),
          ),
          data: ThemeData(
            accentColor: Color(0xff0251a0),
          ),
        ),
      ),
    );
  }

  void toggle() {
    option = !option;
  }

  String qRdata() {
    return myJSONData["firstName"];
    // return (myJSONData["lastName"]+" from "+myJSONData["residence"]).toString();
  }

  Widget getQR() {
    return QrImage(
      data: qRdata(),
      version: 1,
      size: 320,
      gapless: false,
      errorStateBuilder: (cxt, err) {
        return Container(
          child: Center(
            child: Text(
              "Uh oh! Something went wrong...",
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
    // return QrImage(
    //   data: 'This is a simple QR code',
    //   version: QrVersions.auto,
    //   size: 320,
    //   gapless: false,
    // );
  }
}
