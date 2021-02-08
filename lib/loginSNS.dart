import 'package:flutter/material.dart';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:kakao_flutter_sdk/common.dart';

import 'package:eninetour/data/signindata.dart';
import 'package:eninetour/findlogin.dart';
import 'package:eninetour/element/footer.dart';
import 'package:eninetour/data/user.dart';
import 'package:eninetour/MongoDB.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}
class _Login extends State<Login>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // googlelogin
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseUser currentUser;
  String g_name = "";
  String g_email = "";
  String g_url = "";
  String g_phoneNumber = "";

  String f_name = "";
  String f_email = "";
  String f_url = "";
  String f_phoneNumber = "";

  String k_email = "";
  String k_phoneNumber = "";

  bool checkboxValue = false;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if(appcurrentUser.value.name != null) {
      checkboxValue = true;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('로그인',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),),
          centerTitle: true,

        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            // 입력값이 없으면 메시지 출력
                            if (value.trim().isEmpty) {
                              return '아이디를 입력하세요';
                            } else
                              return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 25, 10, 10),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(const Radius.circular(30)),
                            ),
                            hintText: '아이디(이메일계정)',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            // 입력값이 없으면 메시지 출력
                            if (value.trim().isEmpty) {
                              return '비밀번호를 입력하세요';
                            } else
                              return null;
                          },
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 25, 10, 10),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(const Radius.circular(30)),
                            ),
                            hintText: '비밀번호',
                          ),
                        ),
                      ),
                      Row(
                          children:<Widget>[
                            Container(
                              child: CircularCheckBox(
                                  checkColor: Colors.white,  // color of tick Mark
                                  activeColor:  Color(0xFFa328c7),
                                  value: checkboxValue,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkboxValue = newValue;
                                    });
                                  }
                              ),
                            ),

                            Container(
                                child: Text('자동로그인')
                            ),
                          ]
                      ),

                      Container(
                          height: 70,
                          width: 370,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            textColor: Colors.white,
                            color:  Color(0xFFa328c7),
                            child: Text('로그인',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.normal,
                                color: Color(0xffffffff),
                              ),),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                DBConnection.LoginCheck(context, checkboxValue, nameController.text, passwordController.text);
                              }
                            },
                          )),
                        ])
                      ),
                      Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                               // width: 105,
                                child: Wrap(
                                    children: [
                                      FlatButton(
                                        child: Text(
                                          '아이디 찾기',
                                          style: TextStyle(
                                          //    fontSize: 15
                                          ),
                                        ),
                                        onPressed: () {
                                          FindData.titleText = "아이디";
                                          Navigator.pushNamed(context, '/FindID');
                                        },
                                      ),]),
                              ),
                              Container(height: 15, child: VerticalDivider(color: Colors.black, thickness: 1,)),
                              Expanded(
                             //   width: 120,
                                child:  Wrap(
                                  children: [
                                    FlatButton(
                                      child: Text(
                                        '비밀번호 찾기',
                                        style: TextStyle(
                                            //fontSize: 15
                                        ),
                                      ),
                                      onPressed: () {
                                        FindData.titleText = "비밀번호";
                                        Navigator.pushNamed(context, '/FindID');
                                      },
                                ),]),
                              ),
                              Container(height: 15, child: VerticalDivider(color: Colors.black, thickness: 1,)),
                              Expanded(
                                  //width: 90,
                                  child:  Wrap(
                                      children: [FlatButton(
                                        child: Text(
                                          '회원가입',
                                          style: TextStyle(
                                            //  fontSize: 15
                                          ),
                                        ),
                                        onPressed: () {
                                          ////signup screen@
                                          // Join.sns = "test"; //////////////////////////
                                          Navigator.pushNamed(context, '/Join');
                                        },
                                      ),])
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 35, 15, 0),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: FlatButton(

                                child: SvgPicture.asset(
                                  'images/Facebook.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                onPressed: () {
                                  _loginwithFacebook(context);
                                },
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: FlatButton(
                                child: SvgPicture.asset(
                                  'images/Google.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                onPressed: () {
                                  _signInWithGoogle(context);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: FlatButton(
                                child: SvgPicture.asset(
                                  'images/Kakao.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                onPressed: () {
                                  _loginwithKakao(context);
                                },
                              ),
                            )

                          ]),

                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10, bottom: 50),
                          child: Text('SNS로 간편 로그인')
                      ),

                  Container(
                    padding: EdgeInsets.fromLTRB(55, 0, 55, 15),
                    child: Divider(
                      color: Colors.black87,
                      thickness: 1.5
                    ),
                  ),
                  Footer('로그인', '/Login')
                  ],),

        ));
  }

  // google login
  void _signInWithGoogle(var context) async {

    bool result = await googleSingIn();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "google", g_email);
    }

  Future<bool> googleSingIn() async {

    try {
        final GoogleSignInAccount account = await googleSignIn.signIn();
        if(account == null)
          return false;

        final GoogleSignInAuthentication googleAuth = await account.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final AuthResult authResult = await _auth.signInWithCredential(credential);
        final FirebaseUser user = authResult.user;

        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid);

        setState(() {
          g_email = user.email;
          g_url = user.photoUrl;
          g_name = user.displayName;
          g_phoneNumber = user.phoneNumber;

          JoinData.email = g_email;
          if(g_email !='')
            JoinData.enabledfield_email = false;

          JoinData.phone = g_phoneNumber;
          if(g_phoneNumber != null)
            JoinData.enabledfield_phone = false;

          JoinData.sns = 'google';
        });

    }
    catch(err){
      print(err.toString());
      return false;
    }

    return true;
    //return '구글 로그인 성공: $user';
  }

  void googleSignOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      g_email = "";
      g_url = "";
      g_name = "";
      g_phoneNumber = "";
    });

    print("User Sign Out");
  }


  // facebook login
  void _loginwithFacebook(var context) async {

    bool result = await _FacebookLogin();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "facebook", f_email);
  }
  Future<bool> _FacebookLogin() async {
   /* FirebaseAuth auth = FirebaseAuth.instance;
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin.logIn(['email', 'public_profile']);
    if(result.accessToken == null)
      return false;

    AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
    AuthResult authResult = await auth.signInWithCredential(credential); // 구글과 같이 사용시 같은 메일 로그인 에러
    FirebaseUser user = authResult.user;
    f_email = user.email;
    f_phoneNumber = user.phoneNumber;*/


    bool _isLoggedIn = false;
    Map userProfile;
    FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    if(result.accessToken == null)
      return false;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;


    }

    f_email = userProfile["email"];
  //  f_phoneNumber = userProfile["phone"]; // phone 없음

    JoinData.email = f_email;
    if(f_email !='')
      JoinData.enabledfield_email = false;

    JoinData.sns = 'facebook';

    return _isLoggedIn;
  }

  // kakao login
  void _loginwithKakao(var context) async {

    KakaoContext.clientId = "44840422d17ab784509ed9dfb1d56267";
    KakaoContext.javascriptClientId = "06e86238f33989c7f1a31c555474807d";

    bool result = await _KakaoLogin();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "kakao", k_email);
  }
  Future<bool> _KakaoLogin() async {
    final installed = await isKakaoTalkInstalled();
    if(installed == false){
      print("kakaotalk not installed");
   //   return false;
    }

    var code;
    try {
      code = await AuthCodeClient.instance.request(); // login with kakao
    }
    catch(e){
      print("error on issuing AuthCodeClient.instance.request: $e");
      return false;
    }

   // var code = await AuthCodeClient.instance.requestWithTalk(); // login with talk
    await _issueAccessToken(code);

    if(k_email != "") {
      JoinData.email = k_email;
      JoinData.enabledfield_email = false;

      JoinData.phone = k_phoneNumber;
      if(k_phoneNumber != null)
        JoinData.enabledfield_phone = false;

      JoinData.sns = 'kakao';

      return true;
    }
    else
      return false;

  } // _KakaoLogin

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      if(token.accessToken == null)
        return;

      AccessTokenStore.instance.toStore(token);
      final User user = await UserApi.instance.me();
      k_email = user.kakaoAccount.email;
      k_phoneNumber = user.kakaoAccount.phoneNumber;

    } catch (e) {
      print("error on issuing access token: $e");
    }
  }

}

class Join extends StatefulWidget {
  @override
  _Join createState() => new _Join();
}
class _Join extends State<Join> {
  // googlelogin
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseUser currentUser;

  String g_name = "";
  String g_email = "";
  String g_url = "";
  String g_phoneNumber = "";

  String f_name = "";
  String f_email = "";
  String f_url = "";
  String f_phoneNumber = "";

  String k_email = "";
  String k_phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('회원가입',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
              child: Text(
                '이나인투어에\n오신것을 환영합니다!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  color: const Color(0xff271238),
                  fontWeight: FontWeight.w500,
                  height: 1.3333333333333333,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              alignment: Alignment.topLeft,
              child: Text(
                '이나인투어의 회원이 되시면\n더욱 다양한 혜택을 누리실 수 있습니다.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(17, 20, 20, 0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  textColor: Colors.white,
                  color:  Color(0xFFa328c7),
                  child: Text('회원가입',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffffffff),
                    ),),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Certification');
                  },
                )),
            Container(
              padding: EdgeInsets.fromLTRB(17, 70, 20, 10),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 35),
                    child: FlatButton(

                      child: SvgPicture.asset(
                        'images/Facebook.svg',
                        width: 50,
                        height: 50,
                      ),
                      onPressed: () {
                           _loginwithFacebook(context);
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 35),
                    child: FlatButton(
                      child: SvgPicture.asset(
                        'images/Google.svg',
                        width: 50,
                        height: 50,
                      ),
                      onPressed: () {
                            _signInWithGoogle(context);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 35),
                    child: FlatButton(
                      child: SvgPicture.asset(
                        'images/Kakao.svg',
                        width: 50,
                        height: 50,
                      ),
                      onPressed: () {
                        _loginwithKakao(context);
                      },
                    ),
                  ),
                ]),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20, bottom: 50),
                child: Text('SNS로 회원가입',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Colors.black,
                  ),)
            ),
            Container(
              padding: EdgeInsets.fromLTRB(55, 0, 55, 15),
              child: Divider(
                color: Colors.black87,
                thickness: 1.5,
              ),
            ),
            Footer('로그인', '/Login')
          ],
        ),
      ),
    );
  }

  // google login
  void _signInWithGoogle(var context) async {

    bool result = await googleSingIn();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "google", g_email);
  }

  Future<bool> googleSingIn() async {

    try {
      final GoogleSignInAccount account = await googleSignIn.signIn();
      if(account == null)
        return false;

      final GoogleSignInAuthentication googleAuth = await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      setState(() {
        g_email = user.email;
        g_url = user.photoUrl;
        g_name = user.displayName;
        g_phoneNumber = user.phoneNumber;

        JoinData.email = g_email;
        if(g_email !='')
          JoinData.enabledfield_email = false;

        JoinData.phone = g_phoneNumber;
        if(g_phoneNumber != null)
          JoinData.enabledfield_phone = false;

        JoinData.sns = 'google';
      });

    }
    catch(err){
      print(err.toString());
      return false;
    }

    return true;
    //return '구글 로그인 성공: $user';
  }

  void googleSignOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      g_email = "";
      g_url = "";
      g_name = "";
      g_phoneNumber = "";
    });

    print("User Sign Out");
  }


  // facebook login
  void _loginwithFacebook(var context) async {

    bool result = await _FacebookLogin();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "facebook", f_email);
  }
  Future<bool> _FacebookLogin() async {
    /* FirebaseAuth auth = FirebaseAuth.instance;
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin.logIn(['email', 'public_profile']);
    if(result.accessToken == null)
      return false;

    AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
    AuthResult authResult = await auth.signInWithCredential(credential); // 구글과 같이 사용시 같은 메일 로그인 에러
    FirebaseUser user = authResult.user;
    f_email = user.email;
    f_phoneNumber = user.phoneNumber;*/


    bool _isLoggedIn = false;
    Map userProfile;
    FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    if(result.accessToken == null)
      return false;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;


    }

    f_email = userProfile["email"];
    //  f_phoneNumber = userProfile["phone"]; // phone 없음

    JoinData.email = f_email;
    if(f_email !='')
      JoinData.enabledfield_email = false;

    JoinData.sns = 'facebook';

    return _isLoggedIn;
  }

  // kakao login
  void _loginwithKakao(var context) async {

    KakaoContext.clientId = "44840422d17ab784509ed9dfb1d56267";
    KakaoContext.javascriptClientId = "06e86238f33989c7f1a31c555474807d";

    bool result = await _KakaoLogin();
    if (result == true)
      DBConnection.LoginCheckforSNS(context, "kakao", k_email);
  }
  Future<bool> _KakaoLogin() async {
    final installed = await isKakaoTalkInstalled();
    if(installed == false){
      print("kakaotalk not installed");
      //   return false;
    }

    var code;
    try {
      code = await AuthCodeClient.instance.request(); // login with kakao
    }
    catch(e){
      print("error on issuing AuthCodeClient.instance.request: $e");
      return false;
    }

    // var code = await AuthCodeClient.instance.requestWithTalk(); // login with talk
    await _issueAccessToken(code);

    if(k_email != "") {
      JoinData.email = k_email;
      JoinData.enabledfield_email = false;

      JoinData.phone = k_phoneNumber;
      if(k_phoneNumber != null)
        JoinData.enabledfield_phone = false;

      JoinData.sns = 'kakao';

      return true;
    }
    else
      return false;

  } // _KakaoLogin

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      if(token.accessToken == null)
        return;

      AccessTokenStore.instance.toStore(token);
      final User user = await UserApi.instance.me();
      k_email = user.kakaoAccount.email;
      k_phoneNumber = user.kakaoAccount.phoneNumber;

    } catch (e) {
      print("error on issuing access token: $e");
    }
  }
}



