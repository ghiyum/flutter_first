import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:eninetour/data/user.dart';

SharedPreferences prefs;

class DrawerBuilder extends StatefulWidget {
  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  var height, width;
  var _userLog;

  @override
  void initState() {
    intializeshared();
    Future.delayed(Duration(seconds: 2), () {
      sharedValues();
    });
    super.initState();
  }

  void intializeshared() async {
    prefs = await SharedPreferences.getInstance();
  }

  //! Notification value : is not saved on device
  var notificationValue = true;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: appcurrentUser,
      builder: (BuildContext context, value, Widget child) {
        return Drawer(
          child: ListView(
            children: <Widget>[
              _buildUserImage(height, context, width),
              ListTile(
                leading: Icon(Mdi.shieldAccountOutline),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/UserProfile', arguments: false);
                },
                title: Text("Profile"),
              ),
              Divider(),
              _buildNotificationSwitch(),
              Divider(),
              _buildSignOut(context),
            ],
          ),
        );
      },
    );
  }

  _buildSignOut(BuildContext context) {
    return ListTile(
      leading: Icon(Mdi.clipboardArrowLeftOutline),
      title: Text("Sign Out"),
      onTap: () {
        _logout();
      },
    );
  }

  _buildUserImage(double height, BuildContext context, double width) {
    return Container(
      height: 0.25 * height,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).cardColor,
                height: 0.125 * height,
              ),
              Container(
                height: 0.10 * height,
              )
            ],
          )),
          Positioned(
            left: 0.04 * width,
            top: 0.05 * height,
            child: CircleAvatar(
              radius: 50,
           //   backgroundImage: currentUser.value.photo != null
            //      ? NetworkImage(currentUser.value.photo)
            //      : AssetImage('assets/img/user.png'),
            ),
          ),
          Positioned(
            left: 0.325 * width,
            top: 0.0975 * height,
            child: Text(
              appcurrentUser.value.name != null ? appcurrentUser.value.name : '',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(fontSize: 15)),
            ),
          ),
          Positioned(
            left: 0.325 * width,
            top: 0.125 * height,
            child: Text(
              appcurrentUser.value.email == null ? "" : appcurrentUser.value.email,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }


  _buildNotificationSwitch() {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                onTap: () {},
                leading: Icon(Mdi.bell),
                title: Text("Notifications"),
              ),
            ),
            Switch(
              onChanged: (v) {},
              value: notificationValue,
            )
          ],
        ),
        //? To add clickable to whole tab
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                notificationValue = !notificationValue;
              });
            },
          ),
        )),
      ],
    );
  }

  void _logout() {
    _exitApp(context);
  }

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  logout();
                },
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> logout() async {
    print("Logout");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
    await prefs.setBool("isUserLoggedIn", false);
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/AuthPage', (route) => false);
  }

  void sharedValues() async {
    if (prefs.containsKey('current_user')) {
      _userLog = Users.fromJSON(json.decode(prefs.get('current_user')));
    } else {
      _userLog = List();
    }
    print(_userLog);
  }
}
