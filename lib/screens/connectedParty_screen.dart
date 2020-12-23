import 'package:flutter/material.dart';
import 'package:ugId/components/constants.dart';

class ConnectedParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children:[
            Container(
          margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          height: 70.0,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
            child: ListTile(leading: Image.asset("images/nira.png"), trailing: Text("NIRA", style: kConnectedPartiesTextStyle,), enabled: false,) 
            
          ),

               Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          height: 70.0,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
            child: ListTile(leading: Image.asset("images/ura.png"), trailing: Text("URA", style: kConnectedPartiesTextStyle,), enabled: false,) 
            
          ),
             Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          height: 70.0,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
            child: ListTile(leading: Image.asset("images/nssf.png"), trailing: Text("NSSF", style: kConnectedPartiesTextStyle,), enabled: false,) 
            
          ),
             Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          height: 70.0,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
            child: ListTile(leading: Image.asset("images/makerere.png"), trailing: Text("School", style: kConnectedPartiesTextStyle,), enabled: false,) 
            
          ),
          ] 
        ),
      ),
    );
  }
}
