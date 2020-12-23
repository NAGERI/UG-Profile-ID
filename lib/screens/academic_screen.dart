import 'package:flutter/material.dart';
import 'package:ugId/components/constants.dart';
// import 'package:ug_id/components/constants.dart';

class Academic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
              children:[ 
                Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            height: 200.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
              child: ListView(
                children: [
                  ListTile(title: Text("UNIVERSITY"), enabled: false,),
                  ListTile(leading: Image.asset("images/makerere.png"), trailing: Text("Bachelors degree", style: kConnectedPartiesTextStyle,), enabled: false,) 
            
                ],
              )
              // Text("University"),
            ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            height: 200.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
              child: Text("High School"),
            ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            height: 200.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
              child: Text("Primary School"),
            ),
            ],
      ),
    );
  }
}
