import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:eninetour/join.dart';
import 'package:eninetour/data/signindata.dart';
import 'package:eninetour/element/footer.dart';
import 'package:random_string/random_string.dart';

import 'package:eninetour/findlogin.dart';
import 'package:eninetour/utility.dart';

class Certify extends StatefulWidget {
  @override
  _certify createState() => _certify();
}
class _certify extends State<Certify> with SingleTickerProviderStateMixin {

  TabController _controller;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _emailCertifyController = new TextEditingController();

  bool _hasInputError_email = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthResult result;
  bool emailVerified = false;
  FocusNode _focusNode_email;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var mFirebaseAuth = FirebaseAuth.instance;

  String emailcertify = '';

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);

    _focusNode_email = new FocusNode();
    _focusNode_email.addListener(() {
      if (!_focusNode_email.hasFocus) {
        setState(() {
          _hasInputError_email =
              _emailController.text.trim().toString() != '' &&
                  _emailController.text.trim().toString().contains('@');
        });
      }
    }
    );
  }


    Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:  Text('본인인증',
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
                '회원가입을 위한\n본인인증 방법선택',
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
            Expanded(
                child:  TabBar(
                  indicatorColor: Color(0xFFa328c7),
                  labelColor: Color(0xFFa328c7),
                  controller: _controller,
                  tabs: [
                    Tab(
                      text: '본인인증',

                    ),
                    Tab(
                      text: '이메일인증',
                    ),
                  ],
                ),
                ),
            Container(
              height: 300.0,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  Container(
                      child: ListView(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 25, right:15, bottom: 10),
                            child: Text('※본인명의 휴대폰 본인인증 시 제공되는 정보는'
                            '해당 인증기관에서 직접 수집하며, 인증 이외의 용도로'
                            '이용, 저장하지 않습니다.'),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(80, 15, 80, 0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                textColor: Colors.white,
                                color:  Color(0xFFa328c7),
                                child: Text('본인인증',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xffffffff),
                                  ),),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/CertifyforNicePay');
                                },
                              )),
                        ])
                  ),
                  Container(
                    child: Form(
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                      alignment: Alignment.topCenter,
                                      child: TextFormField(
                                        validator: (String value) {
                                          if (value.trim().isEmpty) {
                                            return '이메일을 입력하세요';
                                          }
                                          return null;
                                        },
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: '이메일을 입력해 주세요',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[ButtonTheme(
                                          // minWidth: 60,
                                            height: 60,
                                            child: OutlineButton(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                                              borderSide: BorderSide(width: 1.5),
                                              child: Text("이메일 보내기"),
                                              onPressed: () async {
                                                if( _emailController.text != '' ) {
                                                  emailcertify = randomAlphaNumeric(8);
                                                  SendEmail(_emailController.text, emailcertify);
                                                }
                                              },
                                            )
                                        )
                                        ],
                                      )
                                  )
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                alignment: Alignment.topCenter,
                                child: TextFormField(
                                  validator: (String value) {
                                    if (value.trim().isEmpty) {
                                      return '인증문자를 입력하세요';
                                    }
                                    return null;
                                  },
                                  controller: _emailCertifyController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '이메일 인증문자를 입력해 주세요',
                                  ),
                                ),
                              ),

                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                  width: 0.5 * MediaQuery.of(context).size.width,
                                  child: Expanded(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      textColor: Colors.white,
                                      color:  Color(0xFFa328c7),
                                      child: Text('이메일인증',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.normal,
                                          color: Color(0xffffffff),
                                        ),),
                                      onPressed: () async {
                                        if(emailcertify != _emailCertifyController.text){
                                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                                              content: Text("인증문자열을 다시 확인해주세요")));
                                        }
                                        else {
                                          Utility.ShowDialog(context, '이메일 인증이 완료되었습니다.');
                                        }
                                      },
                                    ),
                                  )
                              ),
                            ])
                    )

                  ),
                ],
              ),
            ),
            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(17, 20, 20, 0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  textColor: Colors.white,
                  color:  Color(0xFFa328c7),
                  child: Text('다음',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffffffff),
                    ),),
                  onPressed: () async{
                    if(result != null){
                      await result.user.reload();
                      FirebaseUser firebaseUser = await mFirebaseAuth.currentUser();
                      emailVerified = firebaseUser.isEmailVerified;
                      JoinData.enabledfield_email = false;
                    }

                    JoinData.emailcertify = emailVerified;
                    JoinData.email = _emailController.text;

                    SignInfo.Clear(); // 회원가입 정보 초기화
                    SignInfo.iscertify_mail = JoinData.emailcertify;
                    SignInfo.iscertify_phone = JoinData.phonecertify;
                    Navigator.pushNamed(context, '/Terms');
                  },
                )),


            Container(
              padding: EdgeInsets.fromLTRB(55, 20, 55, 15),
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
}

/*class certifyforNicePay extends StatelessWidget {

  var sSiteCode = "BT584";
  var sSitePW = "QJpOQYkgmMff";

  var sAuthType = "";      	  //없으면 기본 선택화면, X: 공인인증서, M: 핸드폰, C: 카드
  var sPopGubun 	= "Y";			//Y : 취소버튼 있음 / N : 취소버튼 없음
  var sCustomize 	= "Mobile";			  //없으면 기본 웹페이지 / Mobile : 모바일페이지
  var sGender = "";

  var sReturnUrl = "https://www.naver.com/";	// 성공시 이동될 URL (방식 : 프로토콜을 포함한 절대 주소)
  var sErrorUrl = "https://www.naver.com/";	  	// 실패시 이동될 URL (방식 : 프로토콜을 포함한 절대 주소)
  


  @override
  Widget build(BuildContext context) {
    var sCPRequest = 'BT584' + "_" + DateTime.now().millisecondsSinceEpoch.toString();

    var sPlaincData = "7:REQ_SEQ" + sCPRequest.length.toString() + ":" + sCPRequest +
        "8:SITECODE" + sSiteCode.length.toString() + ":" + sSiteCode +
        "9:AUTH_TYPE" + sAuthType.length.toString() + ":" + sAuthType +
        "7:RTN_URL" + sReturnUrl.length.toString() + ":" + sReturnUrl +
        "7:ERR_URL" + sErrorUrl.length.toString() + ":" + sErrorUrl +
        "11:POPUP_GUBUN" + sPopGubun.length.toString() + ":" + sPopGubun +
        "9:CUSTOMIZE" + sCustomize.length.toString() + ":" + sCustomize +
        "6:GENDER" + sGender.length.toString() + ":" + sGender ;


    return SafeArea(
      child: WebView(
        initialUrl: 'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb' + " " + "ENC" + " " + sSiteCode + " " + sSitePW + " " + sPlaincData,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
*/
class certifyforNicePay extends StatelessWidget {
  //final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'http://auth.e9tour.com/checkplus_main',
        javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
            name: "webtoappClose",
            onMessageReceived: (JavascriptMessage result) {
              if(result.message == 'close'){ // success
                JoinData.phonecertify = true;
                Navigator.pop(context);
              }

            }),
      ]),)
    );
  }
}