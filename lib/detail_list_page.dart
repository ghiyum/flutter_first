import 'package:flutter/material.dart';

import 'package:eninetour/data/tour.dart';
import 'package:eninetour/detail_card_item.dart';

class DetailList extends StatefulWidget {

  final Themes _themes;
  DetailList(this._themes);


  @override
  _detail_list createState() => _detail_list();
}
class _detail_list extends State<DetailList> with TickerProviderStateMixin{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    setItem();
  }

  int cntdetaillist = 0;

  List<dynamic> items;

  setItem(){
    if(widget._themes.index == 0) {
      items = parsedResponseToursTh1;
      cntdetaillist = parsedResponseToursTh1.length;
    }
    else if(widget._themes.index == 1){
      items = parsedResponseToursTh2;
      cntdetaillist = parsedResponseToursTh2.length;
    }
    else if(widget._themes.index == 2){
      items = parsedResponseToursTh3;
      cntdetaillist = parsedResponseToursTh3.length;
    }
    else if(widget._themes.index == 3){
      items = parsedResponseToursTh4;
      cntdetaillist = parsedResponseToursTh4.length;
    }
    else if(widget._themes.index == 4){
      items = parsedResponseToursTh5;
      cntdetaillist = parsedResponseToursTh5.length;
    }
    else if(widget._themes.index == 5){
      items = parsedResponseToursTh6;
      cntdetaillist = parsedResponseToursTh6.length;
    }
    else if(widget._themes.index == 6){
      items = parsedResponseToursTh7;
      cntdetaillist = parsedResponseToursTh7.length;
    }
    else if(widget._themes.index == 7){
      items = parsedResponseToursTh8;
      cntdetaillist = parsedResponseToursTh8.length;
    }
    else if(widget._themes.index == 8){
      items = parsedResponseToursTh9;
      cntdetaillist = parsedResponseToursTh9.length;
    }
  }


  @override
  Widget build(BuildContext context) {
    String title = '';
    if (widget._themes.title != null)
      title = widget._themes.title;

    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 1.0, // tabbar 경계라인
        title: new Text(
          "뜨는 이머징",
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFEFEFEF),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                    FlatButton(
                      minWidth: 50,
                      onPressed: () {
                      },
                      child: new Icon(
                        Icons.tune,
                      ),),
                  ],
            ),),

            // card list
            Container(
              color: Color(0xFFEFEFEF),
              height: 0.76 * MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
               // shrinkWrap: true,
                itemBuilder: (context, index) {
                    return DetailCardItem(item:items[index]);
                },
                itemCount: cntdetaillist,
              ),
            ),
          ]
      )

    );
  }
}