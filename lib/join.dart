import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:eninetour/data/signindata.dart';
import 'package:flutter/services.dart';
import 'package:eninetour/MongoDB.dart';


class Term extends StatefulWidget {
  Term({Key key}) : super(key: key);

  static String sns;

  @override
  _Terms createState() => new _Terms();

}
class _Terms extends State<Term> {
  var isCheck1 = false;
  var isCheck2 = false;
  var isCheck3 = false;
  var isCheck4 = false;
  var isCheck5 = false;
  var isCheck6 = false;
  var isCheckall = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원가입',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 10, left: 20),
            child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                    child: Text(
                      '이나인투어\n전체 약관입니다',
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
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            child: Checkbox(
                              checkColor: Colors.black87,
                              activeColor:  Colors.white,
                              value: isCheck1,
                              onChanged: (value){
                                setState(() {
                                  isCheck1 = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('이나인투어 이용약관 동의',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                              ),),
                            ),
                          ),
                        Expanded(
                            child:Container(
                              child: Text('(필수)',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                        ),
                        Expanded(
                            child: Container(
                              child: FlatButton(
                                color: Colors.white,
                                textColor: Colors.black26,
                                child: Text('>',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/EnineTerms');
                                },
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            child: Checkbox(
                              checkColor: Colors.black87,
                              activeColor:  Colors.white,
                              value: isCheck2,
                              onChanged: (value){
                                setState(() {
                                  isCheck2 = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('개인정보 처리방침 ',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              child: Text('(필수)',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                        ),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: FlatButton(
                                  minWidth: 5,
                                  color: Colors.white,
                                  textColor: Colors.black26,
                                  child: Text('>',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/PersonalInfo');
                                  },
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            child: Checkbox(
                              checkColor: Colors.black87,
                              activeColor:  Colors.white,
                              value: isCheck3,
                              onChanged: (value){
                                setState(() {
                                  isCheck3 = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('해외 여행 약관 ',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text('(필수)',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: FlatButton(
                              minWidth: 10,
                              color: Colors.white,
                              textColor: Colors.black26,
                              child: Text('>',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/OverseaTrip');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            child: Checkbox(
                              checkColor: Colors.black87,
                              activeColor:  Colors.white,
                              value: isCheck4,
                              onChanged: (value){
                                setState(() {
                                  isCheck4 = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('국내 여행 약관 ',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text('(선택)',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: FlatButton(
                              color: Colors.white,
                              textColor: Colors.black26,
                              child: Text('>',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/DomesticTravel');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Checkbox(
                            checkColor: Colors.black87,
                            activeColor:  Colors.white,
                            value: isCheck5,
                            onChanged: (value){
                              setState(() {
                                isCheck5 = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: Text('마케팅 활용에 대한 동의 ',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.normal,
                            ),),
                        ),
                        Container(
                          child: Text('(선택)',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.normal,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Checkbox(
                            checkColor: Colors.black87,
                            activeColor:  Colors.white,
                            value: isCheck6,
                            onChanged: (value){
                              setState(() {
                                isCheck6 = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: Text('마케팅목적 제3자 제공에 대한 동의 ',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.normal,
                            ),),
                        ),
                        Container(
                          child: Text('(선택)',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.normal,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 20, 0),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: CircularCheckBox(
                              checkColor: Colors.white,  // color of tick Mark
                              activeColor:  Color(0xFFa328c7),
                              value: isCheckall,
                              onChanged: (bool value) {
                                setState(() {
                                  isCheckall = value;
                                  isCheck1 = value;
                                  isCheck2 = value;
                                  isCheck3 = value;
                                  isCheck4 = value;
                                  isCheck5 = value;
                                  isCheck6 = value;
                                });
                              }
                          ),
                        ),
                        Container(
                          child: Text('전체 약관 동의 ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 70,
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                        onPressed: () {
                          if(isCheck1 == true && isCheck2 == true && isCheck3 == true) {
                            Navigator.pushNamed(context, '/JoinMember');
                          }
                          else{

                          }
                        },
                      )),
                ]
            )) );
  }
}


class Join_MemberInfo extends StatefulWidget {
  @override
  _Join_MemberInfo createState() => _Join_MemberInfo();
}
class _Join_MemberInfo extends State<Join_MemberInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _birthController = new TextEditingController();
  TextEditingController _pwController = new TextEditingController();
  TextEditingController _pwconfirmController = new TextEditingController();

  List<String> lst = ['남','여'];
  int selectedIndex = 0;

  List<String> lst2 = ['내국인','외국인'];
  int selectedIndex2 = 0;

  int _radioContinue = 3;

  FocusNode _focusNode_email;
  FocusNode _focusNode_phone;
  FocusNode _focusNode_birth;
  FocusNode _focusNode_password;
  FocusNode _focusNode_pwdconfirm;

  bool _hasInputError_email = true;
  bool _hasInputError_phone = true;
  bool _hasInputError_birth = true;
  bool _hasInputError_password = true;
  bool _hasInputError_pwdconfirm = true;

  bool _validator = false;

  final  validNumbers = RegExp(r'(\d+)');
  final  validAlphabet = RegExp(r'[a-zA-Z]');
  final  validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  @override

  void initState() {
    super.initState();
    if(JoinData.enabledfield_email == false)
      _emailController.text = JoinData.email;

    if(JoinData.enabledfield_phone == false)
      _phoneController.text = JoinData.phone;

    _focusNode_email = new FocusNode();
    _focusNode_email.addListener(() {
      if (!_focusNode_email.hasFocus) {
        setState(() {
          _hasInputError_email = _emailController.text.trim().toString() != '' &&
                _emailController.text.trim().toString().contains('@');

          setValidatorState();
        });
      }
    });

    _focusNode_phone = new FocusNode();
    _focusNode_phone.addListener(() {
      if (!_focusNode_phone.hasFocus) {
        setState(() {
          _hasInputError_phone = _phoneController.text.trim().toString().length == 10 ||
              _phoneController.text.trim().toString().length == 11 ;

          setValidatorState();
        });
      }
    });

    _focusNode_birth = new FocusNode();
    _focusNode_birth.addListener(() {
      if (!_focusNode_birth.hasFocus) {
        setState(() {
          _hasInputError_birth = _birthController.text.trim().toString().length == 6;

          setValidatorState();
        });
      }
    });

    _focusNode_password = new FocusNode();
    _focusNode_password.addListener(() {
      if (!_focusNode_password.hasFocus) {
        setState(() {
          _hasInputError_password = _pwController.text.trim().toString().length >= 8 &&
              //validSpecial.hasMatch(_pwController.text.trim().toString()) && // 후에 확장시 사용
              validAlphabet.hasMatch(_pwController.text.trim().toString()) &&
              validNumbers.hasMatch(_pwController.text.trim().toString());

          setValidatorState();
        });
      }
    });

    _focusNode_pwdconfirm = new FocusNode();
    _focusNode_pwdconfirm.addListener(() {
      if (!_focusNode_pwdconfirm.hasFocus) {
        setState(() {
          _hasInputError_pwdconfirm = _pwconfirmController.text.trim().toString() == _pwController.text.trim().toString();

          setValidatorState();
        });
      }
    });
  }

  void setValidatorState(){
    if(_hasInputError_email && _hasInputError_phone && _hasInputError_birth &&
        _hasInputError_password && _hasInputError_pwdconfirm)
      _validator = true;
    else
      _validator = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보입력',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // 키 할당
          key: _formKey,
            child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                    child: Text(
                      '이나인투어\n회원가입 정보입력',
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
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),

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
                                hintText: '이름 입력',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
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
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                    width: 290,
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      enabled: JoinData.enabledfield_email,
                      focusNode: _focusNode_email,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return '이메일을 입력하세요';
                        }
                        /*else if(value.trim().toString().contains('@') != true){
                          return '이메일 형식이 아닙니다';
                        }
                          else*/
                          return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        errorText: _hasInputError_email ? null : "이메일 형식이 아닙니다",
                        border: OutlineInputBorder(),
                        hintText: '이메일 입력',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 7, 0, 0),
                            width: 290,
                            alignment: Alignment.topCenter,
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
                                hintText: '휴대폰번호 입력',
                              ),
                            ),
                        ),),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                width: 145,
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    customRadio2(lst2[0], 0),
                                    customRadio2(lst2[1], 1),
                                  ],
                                )
                            ))
                    ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 9, 0, 0),
                    width: 290,
                    alignment: Alignment.topCenter,
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
                        hintText: '생년월일 입력',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 9, 0, 0),
                    width: 290,
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      focusNode: _focusNode_password,
                      obscureText: true,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return '비밀번호를 입력하세요';
                        }
                        return null;
                      },
                      controller: _pwController,
                      decoration: InputDecoration(
                        errorText: _hasInputError_password ? null : "비밀번호는 영문, 숫자 혼합 8-20자로 구성되어야 합니다.",
                        border: OutlineInputBorder(),
                        hintText: '비밀번호 입력',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 7, 0, 0),
                    width: 290,
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      focusNode: _focusNode_pwdconfirm,
                      obscureText: true,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return '비밀번호 확인';
                        }
                        return null;
                      },
                      controller: _pwconfirmController,
                      decoration: InputDecoration(
                        errorText: _hasInputError_pwdconfirm ? null : "위에 입력한 비밀번호와 다릅니다.",
                        border: OutlineInputBorder(),
                        hintText: '비밀번호 확인',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                    height: 40.0,
                    alignment: Alignment.topLeft,
                    child: Text('※비밀번호는 영문, 숫자 혼합 8-20자로 구성되어야 합니다.',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                      ),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: Text('회원 유지기간',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Radio(
                            activeColor: Color(0xff271238),
                            value: 0,
                            groupValue: _radioContinue,
                            onChanged: (val){setSelectedRadio(val);},
                          ),),
                          new Text(
                            '1년',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          Expanded(
                            child: Radio(
                            activeColor: Color(0xff271238),
                            value: 1,
                            groupValue: _radioContinue,
                            onChanged: (val){setSelectedRadio(val);},
                          ),),
                          new Text(
                            '2년',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Expanded(
                            child: Radio(
                            activeColor: Color(0xff271238),
                            value: 2,
                            groupValue: _radioContinue,
                            onChanged: (val){setSelectedRadio(val);},
                          ),),
                          new Text(
                            '3년',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          Expanded(
                            child: Radio(
                            activeColor: Color(0xff271238),
                            value: 3,
                            groupValue: _radioContinue,
                            onChanged: (val){setSelectedRadio(val);},
                          ),),
                          new Text(
                            '탈퇴시까지',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 버튼
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
                          if (_formKey.currentState.validate() && _validator) {
                            SignInfo.name = _nameController.text;
                            SignInfo.gender = lst[selectedIndex];
                            SignInfo.email = _emailController.text;
                            SignInfo.phone = _phoneController.text;
                            SignInfo.dofor = lst2[selectedIndex2];
                            SignInfo.birth = _birthController.text;
                            SignInfo.password = _pwController.text;
                            SignInfo.year = _radioContinue;
                            SignInfo.sns = Term.sns;

                            DBConnection.Signin(context);
                          }
                          else{
                            if(_hasInputError_email == false)
                              FocusScope.of(context).requestFocus(_focusNode_email);
                            else if(_hasInputError_phone == false)
                              FocusScope.of(context).requestFocus(_focusNode_phone);
                            else if(_hasInputError_birth == false)
                              FocusScope.of(context).requestFocus(_focusNode_birth);
                            else if(_hasInputError_password == false)
                              FocusScope.of(context).requestFocus(_focusNode_password);
                            else if(_hasInputError_pwdconfirm == false)
                              FocusScope.of(context).requestFocus(_focusNode_pwdconfirm);
                          }
                        },
                      )),
                ]
            )
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

  setSelectedRadio(int val) {
    setState(() {
      _radioContinue = val;
    });
  }

  void changeIndex2(int index){
    setState(() {
      selectedIndex2 = index;
    });
  }
  Widget customRadio2(String txt,int index){
    return ButtonTheme(
        minWidth: 60,
        height: 60,
        child: OutlineButton(
          onPressed: () => changeIndex2(index),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          borderSide: BorderSide(color: selectedIndex2 == index ? Colors.black : Colors.grey, width: 1.5),
          child: Text(txt,style: TextStyle(color: selectedIndex2 == index ?Colors.black : Colors.grey),),
        )
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('회원가입완료',
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
              SignInfo.name + '\n회원님 환영합니다!',
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
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              alignment: Alignment.topLeft,
              child: Text(
                '이나인투어에서 전세계 모든 여행 서비스를 경험하실 수 있습니다. 즐겁고 행복한 여행되세요.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
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
