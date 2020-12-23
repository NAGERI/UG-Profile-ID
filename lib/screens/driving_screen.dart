import 'package:flutter/material.dart';

class Driving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        height: 500.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Text('ID No: 6905151282201'),
              Text('Valid to : 12/04/2020'),
              Text('Issued by Uganda')
            ],
          ),
        ),
      ),
    );
  }
}
