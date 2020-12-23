import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
const kTextFieldStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'SourceSansPro',
  fontSize: 18.0,
);
const kTextFieldStyle2 = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: 'Raleway',
  fontSize: 18.0,
);
const kTitleTextStyle = TextStyle(fontFamily: 'SourceSansPro', fontSize: 25.0);
const kOptionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const kConnectedPartiesTextStyle = TextStyle(fontFamily: 'SourceSansPro',color: Colors.black, fontSize: 25.0);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.blue, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
