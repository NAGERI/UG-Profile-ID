import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:ugId/components/scanner.dart';
import 'package:ugId/components/web3Screen.dart';
import 'package:ugId/screens/details_screen.dart';
import 'package:ugId/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: Color(0xff013588),
        scaffoldBackgroundColor: Colors.grey,
        primaryColor: Color(0xff0251a0),
      ),
      initialRoute:LoginScreen.id,
      // initialRoute: DetailsScreen.id,
      // Web3Screen.id, //fordebugging blockchain
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
        Settings.id: (context) => Settings(),
        Scanner.id: (context) => Scanner(),
        Web3Screen.id: (context) => Web3Screen()
      },
      home: LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
