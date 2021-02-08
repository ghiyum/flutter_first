import 'package:eninetour/data/tour.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailCardItem extends StatefulWidget {

  final dynamic item;
  const DetailCardItem ({ Key key, this.item }): super(key: key);

  @override
  _detailCardItem createState() => _detailCardItem();
}
class _detailCardItem extends State<DetailCardItem> with TickerProviderStateMixin{
  bool _hasBeenPressed = false;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 18.0),
      child: Container(
        height: 0.6 * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.55,
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
          borderRadius: BorderRadius.circular(12.0),
          child: buildStack(context, 0.6 * MediaQuery.of(context).size.height, width),
        ),
      ),
    );
  }

//Split into methods for clean code and increasing readability
  buildStack(BuildContext context, var height, var width) {
    return Stack(
      children: <Widget>[
        Column(
            children: <Widget>[
            Container(
              height: 0.5 * height,
              width: width,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      'https://1337.e9tour.com' + widget.item['coverimage']['url']
                  ),
                ),
              ),
            ),
            Container(
              height: 0.5 * height,
              width: width,
              color: Colors.white,
            ),
        ]),
        Row(children: [
          SizedBox(
            height: height - (0.06 * height),
          ),
          Container(
              width: 0.15 * width,
              height: 0.06 * height,
              decoration: BoxDecoration(
                color: Color(0xff271238),
              ),
              child:  Center(
                child: FittedBox(
                  child: Text(
                   widget.item['category'],

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                    ),),
                ),
              )
          ),
          Container(
              width: 0.15 * width,
              height: 0.06 * height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:  Center(
                child: FittedBox(
                  child: Text(
                    widget.item['reservationable'],

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),),
                ),
              )
          ),
        ],),

        _buildText(context, height, width),
        Container(
          height: 0.8 * height,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/DetailTours', arguments: widget.item);
              },
            ),
          ),
        ),
      ],
    );
  }

  _buildText(context, height, width) {

    String price = NumberFormat('###,###,###,###').format(int.parse(widget.item['price'])).replaceAll(' ', '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 0.5 * height,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 1.5, top: 20),
          child: Text(
            widget.item['usabledate'],

            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              color: Color(0xff3DC2C6),
              fontWeight: FontWeight.w500,
              height: 1.3333333333333333,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
          child: Text(
            widget.item['title'],

            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              height: 1.3333333333333333,
            ),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.fromLTRB(17, 10, 20, 10),
          child: Divider(
            color: Color(0xffEFEFEF),
            thickness: 1.1,
          ),
        ),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              price,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.w600,
                height: 1.3333333333333333,
              ),
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '원',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 21,
                color: Colors.red,
                fontWeight: FontWeight.w500,
                height: 1.3333333333333333,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
              child: RatingBar.builder(
                itemSize: 20,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xff3DC2C6),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
          ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
              child: FlatButton.icon(
                minWidth: 50,
                icon: Icon(
                  Icons.favorite_border,
                  color: _hasBeenPressed ? Colors.deepOrange : Colors.grey,
              ),
                label: Text(''),
                onPressed: () {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  });
                  },
              ),),
        ],)

      ],
    );
  }
}
