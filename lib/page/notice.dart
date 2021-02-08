import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> parsedResponseNotice;

// 공지
getClubBoard() async {
  final response  = await http.get('https://1337.e9tour.com/club-boards');
  parsedResponseNotice = jsonDecode(response.body);
}

class notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('공지사항',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 10, left: 0),
            child:
            _buildBoard(),
        )
    );
  }
}

_buildBoard(){
  List<Widget> reasonList = [];
  parsedResponseNotice.forEach((element) {
    reasonList.add(
        new ExpansionTile(
          title: Row(
            children: [
              new Icon(
                Icons.campaign_outlined,
              ), new Text('  ' + element['title'], style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
              ),),
            ],
          ),
          children: [
            new Text( element['contents'], style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
            ),),
          ],
        ));
  });
  return new Column(children: reasonList);
}