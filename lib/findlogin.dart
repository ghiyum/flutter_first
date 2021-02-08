import 'package:eninetour/MongoDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:eninetour/data/signindata.dart';
import 'package:eninetour/element/footer.dart';

import 'package:mailgun/mailgun.dart';
import 'package:random_string/random_string.dart';

class FindId extends StatefulWidget {
  @override
  _findid createState() => _findid();
}
class _findid extends State<FindId> with SingleTickerProviderStateMixin {

  final List<String> _tabs = ["아이디","비밀번호"];

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _birthController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _emailCertifyController = new TextEditingController();

  List<String> lst = ['남','여'];
  int selectedIndex = 0;

  FocusNode _focusNode_phone;
  FocusNode _focusNode_email;
  FocusNode _focusNode_birth;

  bool _hasInputError_phone = true;
  bool _hasInputError_email = true;
  bool _hasInputError_birth = true;

  TabController _controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String emailcertify = '';


  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 2, vsync: this);
    if(FindData.titleText == '아이디')
      _controller.index = 0;
    else if(FindData.titleText == '비밀번호')
      _controller.index = 1;

    _controller.addListener((){
      setState(() {
        FindData.titleText = _tabs[_controller.index];
      });

    });

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

    _focusNode_phone = new FocusNode();
    _focusNode_phone.addListener(() {
      if (!_focusNode_phone.hasFocus) {
        setState(() {
          _hasInputError_phone = _phoneController.text.trim().toString().length == 10 ||
              _phoneController.text.trim().toString().length == 11 ;
        });
      }
    });

    _focusNode_birth = new FocusNode();
    _focusNode_birth.addListener(() {
      if (!_focusNode_birth.hasFocus) {
        setState(() {
          _hasInputError_birth = _birthController.text.trim().toString().length == 6;
        });
      }
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:  new Text( FindData.titleText + ' 찾기',
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
                FindData.titleText +'를\n잊어버리셨나요?',
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
                    text: '아이디 찾기',

                  ),
                  Tab(
                    text: '비밀번호 찾기',
                  ),
                ],
              ),
            ),
            Container(
              height: 300.0,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  Expanded(
                      child: ListView(
                          children: <Widget>[
                            ExpansionTile(
                              title: Text("등록된 정보로 찾기", style: TextStyle(
                                fontFamily: 'Roboto',
                              ),),
                              children: [
                                Column(children: [
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                            alignment: Alignment.topCenter,
                                            child: TextFormField(
                                              validator: (String value) {
                                                if (value.trim().isEmpty) {
                                                  return '이름을 입력하세요';
                                                }
                                                return null;
                                              },
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: '이름을 입력해 주세요',
                                              ),
                                            ),
                                          ),
                                        ),
                                         Container(
                                              padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                              width: 145,
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  customRadio(lst[0], 0),
                                                  customRadio(lst[1], 1),
                                                ],
                                              )
                                          )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                                          focusNode: _focusNode_birth,
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return '생년월일 6자리를 입력하세요';
                                            }
                                            return null;
                                          },
                                          controller: _birthController,
                                          decoration: InputDecoration(
                                            errorText: _hasInputError_birth ? null : "생년월일은 6자리입니다",
                                            border: OutlineInputBorder(),
                                            hintText: '생년월일을 입력해주세요',
                                          ),
                                        ),
                                      ),
                                  ],),),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: TextFormField(
                                              enabled: JoinData.enabledfield_phone,
                                              focusNode: _focusNode_phone,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                                              validator: (value) {
                                                if (value.trim().isEmpty) {
                                                  return '휴대전화번호를 입력하세요';
                                                }
                                                else
                                                  return null;
                                              },
                                              controller: _phoneController,
                                              decoration: InputDecoration(
                                                errorText: _hasInputError_phone ? null : "휴대폰 번호를 다시 확인해주세요",
                                                border: OutlineInputBorder(),
                                                hintText: '휴대폰번호를 입력해주세요',
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      width: 200,
                                      child: Expanded(
                                        child: RaisedButton(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          textColor: Colors.white,
                                          color:  Color(0xFFa328c7),
                                          child: Text('찾기',
                                          style: TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.normal,
                                          color: Color(0xffffffff),
                                        ),),
                                          onPressed: () async {
                                           bool result = await DBConnection.FindID(_nameController.text, lst[selectedIndex], _birthController.text, _phoneController.text);
                                           if(result)
                                             Navigator.pushNamed(context, '/LoginFindResultID');
                                           else
                                             Navigator.pushNamed(context, '/LoginFindResultFail');
                                          },
                                        ),
                                      )
                                  ),
                                ],),]),
                            ExpansionTile(
                              title: Text("휴대폰 인증", style: TextStyle(
                                fontFamily: 'Roboto',
                              ),),
                              children: [
                                Column(children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '※본인명의 휴대폰 본인인증 시 제공되는 정보는'
                                      '해당 인증기관에서 직접 수집하며, 인증 이외의 용도로'
                                    '이용, 저장하지 않습니다.',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      width: 200,
                                      child: Expanded(
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          textColor: Colors.white,
                                          color:  Color(0xFFa328c7),
                                          child: Text('휴대폰 인증',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.normal,
                                              color: Color(0xffffffff),
                                            ),),
                                          onPressed: () async {
                                            Navigator.pushNamed(context, '/Certifyforphone');
                                          },
                                        ),
                                      )
                                  ),
                                ])],
                            ),


                          ],
                      )
                  ),

                  // 두번째 탭바
                  Container(
                      child: Form(
                          child: ListView(
                              children: <Widget>[
                                ExpansionTile(
                                  title: Text("휴대폰 인증", style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),),
                                  children: [
                                    Column(children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '※본인명의 휴대폰 본인인증 시 제공되는 정보는'
                                              '해당 인증기관에서 직접 수집하며, 인증 이외의 용도로'
                                              '이용, 저장하지 않습니다.',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                          width: 200,
                                          child: Expanded(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                              textColor: Colors.white,
                                              color:  Color(0xFFa328c7),
                                              child: Text('휴대폰 인증',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xffffffff),
                                                ),),
                                              onPressed: () {
                                                Navigator.pushNamed(context, '/Certifyforphone');
                                              },
                                            ),
                                          )
                                      ),
                                    ])],
                                ),
                                ExpansionTile(
                                  title: Text("이메일 인증", style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),),
                                  children: [
                                    Column(children: [
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                alignment: Alignment.topCenter,
                                                child: TextFormField(
                                                  validator: (String value) {
                                                    if (value.trim().isEmpty) {
                                                      return '이름을 입력하세요';
                                                    }
                                                    return null;
                                                  },
                                                  controller: _nameController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: '이름을 입력해 주세요',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  customRadio(lst[0], 0),
                                                  SizedBox(width: 5,),
                                                  customRadio(lst[1], 1),
                                                ],
                                              )
                                          )
                                          ],
                                        ),),
                                      Container(
                                        child: Row(
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
                                                      height: 60,
                                                      child: OutlineButton(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                                                        borderSide: BorderSide(width: 1.5),
                                                        child: Text("이메일 보내기"),
                                                        onPressed: () async {
                                                          if(_nameController.text != '' && _emailController.text != '' ) {
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
                                        ),),

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
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                          width: 200,
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
                                                  bool result = await DBConnection.FindPWforEmail(_nameController.text, lst[selectedIndex], _emailController.text);
                                                  if(result)
                                                    Navigator.pushNamed(context, '/LoginFindResultPW');
                                                  else
                                                    Navigator.pushNamed(context, '/LoginFindResultFail');
                                                }
                                              },
                                            ),
                                          )
                                      ),
                                    ])],
                                ),
                              ])
                      )

                  ),
                ],
              ),
            ),



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


  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  Widget customRadio(String txt,int index){
    return ButtonTheme(
        minWidth: 60,
        height: 60,
        child: OutlineButton(
          onPressed: () => changeIndex(index),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          borderSide: BorderSide(color: selectedIndex == index ? Colors.black : Colors.grey, width: 1.5),
          child: Text(txt,style: TextStyle(color: selectedIndex == index ?Colors.black : Colors.grey),),
        )
    );
  }
}

class FindData{
  static String id = '';
  static String pw = '';

  static String titleText = '';

  static String failtitle = '';
}
class LoginFindResultID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        title:  Text('아이디 찾기',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),),
        centerTitle: true,
      ),
      body: Center(
       // padding: EdgeInsets.only(bottom: 10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                '당신의 아이디는 '+ FindData.id + '입니다.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                    Navigator.pushNamed(context, '/Login');
                  },
                )),
          ],
        ),
      ),
    );
  }
}
class LoginFindResultPW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title:  Text('비밀번호 찾기',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),),
        centerTitle: true,
      ),
      body: Center(
        // padding: EdgeInsets.only(bottom: 10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 15, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                '당신의 비밀번호는 '+ FindData.pw + '로 초기화 되었습니다.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                    Navigator.pushNamed(context, '/Login');
                  },
                )),
          ],
        ),
      ),
    );
  }
}
class LoginFindResultFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title:  Text('아이디&비밀번호 찾기',
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
              padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
              alignment: Alignment.topLeft,
              child: Text(
                '회원정보를 찾을 수 없습니다.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                    Navigator.pushNamed(context, '/Join');
                  },
                )),
          ],
        ),
      ),
    );
  }
}

 SendEmail(var email, var text) async {
  String username = 'dev@e9tour.com';

  var mailgun = MailgunMailer(domain: "e9tour.com", apiKey: "31c22c005eacc3dfe5eaf79409cbdfcb-c50a0e68-b82dbb38");

  var response = await mailgun.send(
      from: username,
      to: [email],
      subject: "이메일 인증 메일입니다",
      text: "다음 문자를 핸드폰에 입력하세요.\n\n" + text);

  print(response.message);

}
