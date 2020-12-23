import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ugId/components/constants.dart';
import 'package:ugId/components/rounded_button.dart';
import 'package:ugId/components/web3Functions.dart';
import 'package:ugId/screens/details_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, ninValue;
  String password;
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;
  // FirebaseUser registerdUser;

  var imageString = getImage();

  @override
  void initState() {
    super.initState();
    loadingJSON();
    getConnection();
    getImage();
    getJSONData();
  }

  bool _result;
  void loadingJSON() {
    setState(() {
      if (myJSONData != null) {
        _result = false;
      } else {
        // EasyLoading.dismiss();
        _result = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      // body: ModalProgressHUD(
      //   inAsyncCall: showSpinner,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/2.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                ninValue = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your NIN',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  color: Color(0xff0251a0),
                  text: 'Recover',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    Navigator.pushNamed(context, DetailsScreen.id);
                    // try {
                    //   final user = await _auth.signInWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if (user != null) {
                    //     Navigator.pushNamed(context, DetailsScreen.id);
                    //   }
                    //   setState(() {
                    //     showSpinner = false;
                    //   });
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                ),
                RoundedButton(
                  color: Color(0xff0251a0),
                  text: 'Log In',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                      // EasyLoading.show().timeout(Duration(milliseconds:2500));

                      EasyLoading.show(status: 'loading...');
                    });

                    try {
                      //   final user = await _auth.signInWithEmailAndPassword(
                      //       email: email, password: password);
                      //   if (user != null) {
                      //     Navigator.pushNamed(context, DetailsScreen.id);
                      //   }
                      if (ninValue == myJSONData["nin"]) {
                        Navigator.pushNamed(context, DetailsScreen.id);
                      }else{
                        EasyLoading.showToast('Wrong NIN, Try again');
                      }
                      setState(() {
                        showSpinner = false;
                        EasyLoading.dismiss();
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final spinkit = SpinKitFadingCircle(
    // duration: Duration(milliseconds: 1200),
    size: 100.0,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.pink[600] : Colors.green,
        ),
      );
    },
  );
// Text("Loading...", style: kTextFieldStyle)
}
