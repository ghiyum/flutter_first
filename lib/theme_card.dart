
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:eninetour/data/tour.dart';

// 9테마
List<dynamic> parsedResponseTheme9;
 get9ThemeCover() async {
  var response  = await http.get('https://1337.e9tour.com/theme-9-s');
  parsedResponseTheme9 = jsonDecode(response.body);
}

class ThemeCard extends StatefulWidget {
  final int index;
  const ThemeCard ({ Key key, this.index }): super(key: key);

  @override
  _themecard createState() => _themecard();
}
class _themecard extends State<ThemeCard> with TickerProviderStateMixin{
  String Image = '';
  String title = '';
  String comment = '';

  SetElement() async{
    if(parsedResponseTheme9 != null){
      Image = 'https://1337.e9tour.com' + parsedResponseTheme9[widget.index]['coverimage'][0]['url'];
      title = parsedResponseTheme9[widget.index]['title'];
      comment = parsedResponseTheme9[widget.index]['comment'];
    }
    else{
      Image = '';
      title = '';
      comment = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    SetElement();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 18.0),
      child: Container(
        height: 0.3 * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Colors.black38.withOpacity(0.1),
              spreadRadius: 5.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: buildStack(context),
        ),
      ),
    );
  }

//Split into methods for clean code and increasing readability
  buildStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child:Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    Image),),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
        ),
        _buildTextAndUser(context),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Themes _themes = new Themes(widget.index, parsedResponseTheme9[widget.index]['title']);
                Navigator.pushNamed(context, '/DetailList', arguments: _themes);
              },
            ),
          ),
        )
      ],
    );
  }

  _buildTextAndUser(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 1.5),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              color: Color(0xffffffff),
              fontWeight: FontWeight.bold,
              height: 1.3333333333333333,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 30.0),
          child: Text(
            comment,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
              height: 1.3333333333333333,
            ),
          ),
        ),
      ],
    );
  }
}
