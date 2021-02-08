import 'package:flutter/material.dart';
import 'package:eninetour/MongoDB.dart';
import 'package:eninetour/utility.dart';

class Footer extends StatelessWidget {

  final String login;
  final String navi;
  Footer(this.login, this.navi);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        children: <Widget>[
          Expanded(
            child: Row(
                children: <Widget>[
                Expanded(
                  child: ButtonTheme(
                  minWidth: 100,
                  // height: 60,
                    child: OutlineButton(
                      onPressed: () {
                        if(login == '로그인')
                          Navigator.pushNamed(context, navi);
                        else if(login == '로그아웃') {
                          DBConnection.logout();
                          Utility.ShowDialog(context, "로그아웃 되었습니다.");
                        }
                      },
                    // borderSide: BorderSide(width: 1),
                    child: Text(login),
                  )
            ),),
                  Expanded(
                    child: ButtonTheme(
                      //minWidth: 60,
                      // height: 60,
                        child: OutlineButton(
                        onPressed: () {
                        },
                        //  borderSide: BorderSide(width: 1.5),
                        child: Text('고객센터'),
                        )
                      ),
                    ),
                ],
            ),
          ),
        Container(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Text(
                      '이용약관',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/EnineTerms');
                      },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Text(
                    '개인정보처리방침',
                    style: TextStyle(fontSize: 12),
                    ),
                      onPressed: () {
                      Navigator.pushNamed(context, '/PersonalInfo');
                      },
                    ),
                ),

              ],
              mainAxisAlignment: MainAxisAlignment.center,
          )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 57.0),
              child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Text(
                      '여행약관',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/DomesticTravel');
                    },
                  ),
                ),
                Expanded(child: FlatButton(
                  child: Text(
                    '해외여행약관',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/OverseaTrip');
                  },
                ))
              ])),
          Container(
            padding: const EdgeInsets.only(top: 95.0),
            alignment: Alignment.center,
            child: Text(
              '이나인투어 | 대표: 박대인'
                  '\n주소:(06038)서울특별시 강남구 도산대로8길20(논현동) BK빌딩 2층',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 120.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  //alignment: Alignment.center,
                  child: ButtonTheme(
                      child: FlatButton(
                        onPressed: () {
                        },
                        child: Text('전화'),
                      )
                  ),),
                Expanded(
                  //  alignment: Alignment.center,
                  child: ButtonTheme(
                      child: FlatButton(
                        onPressed: () {
                        },
                        child: Text('팩스'),
                      )
                  ),
                ),
              ],
            ),),
          Container(
            padding: const EdgeInsets.only(top: 140.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('사업자등록번호 : 644-81-01832',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,),
                ),
                Expanded(
                  //  alignment: Alignment.center,
                  child: ButtonTheme(
                      child: FlatButton(
                        onPressed: () {
                        },
                        child: Text('사업자정보확인',
                          style: TextStyle(fontSize: 12),),
                      )
                  ),
                ),
              ],
            ),),
          Container(
            padding: const EdgeInsets.only(top: 175.0),
            alignment: Alignment.center,
            child: Text(
              '통신판매업신고번호 : 2020-서울강남-03058'
                  '\n관광사업자등록번호 : 제 2020-50호'
                  '\n영업보증보험 : 5천만원 가입'
                  '\n개인정보 보호책임자 : 박병채'
                  '\n이메일 : contact@e9tour.com'
                  '\n\nCOPYRIGHT ⓒ E9TOUR SERVICE INC. ALL RIGHTS RESERVED',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),



          ],
        ),
      );
  }

//? Split the build method into smaller components for better reading


}