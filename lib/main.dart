import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:eninetour/page/homepage.dart';
import 'package:eninetour/route_generator.dart';
import 'package:eninetour/theme_card.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor:  Color(0xff271238),
        accentColor: const Color(0xFFa328c7),
      ),
      initialRoute: '/Main',
      onGenerateRoute: RouteGenerator.generateRoute,
    //  home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);


    if (_seen) {
      await get9ThemeCover();
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

// 맨 처음만 실행, 권한 확인 포함
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff271238),
        body: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 20, left: 20),
            child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "\n이나인투어에"
                          "\n오신것을 환영합니다!",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 0, bottom: 0, left: 10,  right: 18),
                      child: Text(
                        "\n이나인투어 앱 이용을 위한 권한 안내"
                            "\n서비스 제공을 위해 다음과 같은 접근권한을 필요로 합니다."
                            "\n선택적 접근 권한의 경우, 허용하지 않더라도 서비스의 기본 기능을 사용할 수 있습니다."
                            "\n\n필수적 접근 권한"
                            "\nSMS, 저장공간, 통화기록, 전화, 화면"
                            "\n\n선택적 접근 권한"
                            "\n위치, 주소록, 카메라",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff),),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 0, bottom: 20, left: 10,  right: 20),
                      child: Text(
                        "\n※ 접근 권한 동의 후, 다음과 같이 접근권한을 재설정하거나 철회할 수 있습니다."
                            "\n\n※ 단말기 설정 > 애플리케이션 관리 또는 앱 > 해당 앱 선택 > 접근권한 동의 또는 철회 선택",

                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffcbcbcb),),
                      )),
                  ButtonTheme(
                    minWidth:350,
                    buttonColor: Color(0xff271238), // 남는 부분 배경색으로
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                      onPressed: () async{
                        await requestPermission();
                        await get9ThemeCover();
                        Navigator.pushNamed(context, '/Home');
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0,  right: 15),
                      child: Container(
                        width: 370,
                        decoration: const BoxDecoration(
                          borderRadius: const BorderRadius.all(const Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFa328c7),
                              Color(0xFFfd5151),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          '확인',
                          style: TextStyle(fontSize: 20),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ]
            )) );
  }

  void requestPermission() async {

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location, //locationWhenInUse
      Permission.notification,
      Permission.camera,
      Permission.contacts,
      Permission.sms,
      Permission.phone,
      Permission.storage,
    ].request();
  }
}

