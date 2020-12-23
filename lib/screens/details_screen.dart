import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugId/components/constants.dart';
import 'package:ugId/components/scanner.dart';
import 'package:ugId/components/web3Functions.dart';
import 'package:ugId/screens/academic_screen.dart';
import 'package:ugId/screens/connectedParty_screen.dart';
import 'package:ugId/screens/driving_screen.dart';
import 'package:ugId/screens/login_screen.dart';
import 'package:ugId/screens/medical_screen.dart';
import 'package:ugId/screens/personal_screen.dart';
import 'package:ugId/screens/workInfo_screen.dart';

class DetailsScreen extends StatefulWidget {
  static String id = 'details_screen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //Fetch blockchain data, to be used in the application.
  @override
  void initState() {
    super.initState();
    getConnection();
    getImage();
    getJSONData();
    if (getJSONData() == null) {
      EasyLoading.show(status: 'loading...');
    }
  }

  static int index = 1;
  static int _selectedIndex = 0;
  static bool option = false;

  static List<Object> _bottomNavOptions = [
    Personal(),
    ConnectedParty(),
    Scanner(),
  ];

//* The bottom navigation chooses the index */
  void _onItemTapped(int index) {
    setState(() {
      /*sets the  state and toggles btn the drawer & bottomNavBar (keeps to false) */
      option = false;
      _selectedIndex = index;
    });
  }

  Object choice() {
    /*return type can be dynamic incase not sure of the 
    return type. (then no need for return statement) */
    switch (index) {
      case 1:
        return Personal();
        break;
      case 2:
        return Academic();
        break;
      case 3:
        return Driving();
      case 4:
        return Medication();
      case 5:
        return WorkInfo();

      // case 6:
      //   return Settings();
      // case 6: return GenerateCV();

      default:
    }
    return []; //returns an empty object incase no index matches
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // title: Text('Home'),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Connected Acct\'s',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Scan QR',
            // title: Text('scan QR'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff0251a0),
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              curve: Curves.fastOutSlowIn,
              child: Text(
                '',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Color(0xff0251a0),
                image: DecorationImage(
                  image: AssetImage('images/3.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            ListTile(
              title: Text('Personal Information', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.idBadge),
              onTap: () {
                setState(() {
                  option = true;
                  index = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Academic', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.graduationCap),
              onTap: () {
                setState(() {
                  option = true;
                  index = 2;
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Driving license', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.car),
              onTap: () {
                // Update the state of the app
                setState(() {
                  option = true;
                  index = 3;
                });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Medical Information', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.briefcaseMedical),
              onTap: () {
                // Update the state of the app
                setState(() {
                  option = true;
                  index = 4;
                });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Work Information', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.briefcase),
              onTap: () {
                // Update the state of the app
                setState(() {
                  option = true;
                  index = 5;
                });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Generate CV', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.penAlt),
              onTap: () {
                // Update the state of the app
                // setState(() {
                // option = true;
                //  index = 6;
                //});
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1.5,
              height: 6.0,
            ),
            ListTile(
              title: Text('Settings', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.cog),
              onTap: () {
                // Update the state of the app
                // setState(() {
                //   option = true;
                //   index = 6;
                //   Settings();
                // });
                // Then close the drawer
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Settings()));
                Navigator.popAndPushNamed(context, Settings.id);
              },
            ),
            ListTile(
              title: Text('Logout', style: kTextFieldStyle),
              leading: Icon(FontAwesomeIcons.signOutAlt),
              onTap: () {
                // Update the state of the app
                // setState(() {
                // option = true;
                //  index = 6;
                //});
                Navigator.popAndPushNamed(context, LoginScreen.id);
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        /** Choosing which screen to render based on the drawer or bottom nvigation */
        child: option ? choice() : _bottomNavOptions.elementAt(_selectedIndex),
      ),

      /// option toggles beetween bottom navbvar and drawer options in setState() method.
      appBar: AppBar(
        title: Text(
          'Indentity Details',
          style: kTitleTextStyle,
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  static String id = 'settings_screen';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: kTitleTextStyle,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            // ListTile(
            //   leading: Icon(Icons.school),
            //   title: Text('Makerere School'),
            // ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Request Validation School details'),
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Request Validation driver permit'),
            )
          ],
        ),
      ),
    );
  }
}
