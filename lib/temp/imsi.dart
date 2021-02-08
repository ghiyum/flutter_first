import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class Post {

  final String merchantKey;
  final String merchantID;
  final String ediDate;
  final String amt;
  final String returnURL;
  final String goodsName;
  final String moid;
  final String buyerName;
  final String buyerEmail;
  final String buyerTel;

  Post({
    this.merchantKey,
    this.merchantID,
    this.ediDate,
    this.amt,
    this.returnURL,
    this.goodsName,
    this.moid,
    this.buyerName,
    this.buyerEmail,
    this.buyerTel,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      merchantKey: json['merchantKey'],
      merchantID: json['merchantID'],
      ediDate: json['ediDate'],
      amt: json['amt'],
      returnURL: json['returnURL'],
      goodsName: json['goodsName'],
      moid: json['moid'],
      buyerName: json['buyerName'],
      buyerEmail: json['buyerEmail'],
      buyerTel: json['buyerTel'],
    );
  }
}

class payment extends StatefulWidget {
  @override
  _payment createState() => _payment();
}
class _payment extends State<payment> {
  final String TAG = "NICE";
  final String MERCHANT_URL = "https://web.nicepay.co.kr/v3/v3Payment.jsp";

  InAppWebViewController _webViewController;

  var index;
  var merchantKey = "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg==";
  var merchantID = "nicepay00m";
  var ediDate = DateFormat('yyyyMMddhhmmss').format(new DateTime.now());
  var amt = '1004';
  var returnURL = 'http://localhost:3000/authReq';
  var goodsName = "나이스상품";
  var moid = 'nice_api_test_3.0';
  var buyerName = '구매자';
  var buyerEmail = 'happy@day.com';
  var buyerTel = '00000000000';

  SetData(){
    index =
    //'{\'goodsName\' : ' + goodsName + ',\'amt\' : ' + amt + ',\'moid\' : ' + moid + ',\'buyerName\' : ' + buyerName + ',\'buyerEmail\' : ' + buyerEmail + ',\'buyerTel\' : ' + buyerTel + ',\'merchantID\': ' + merchantID + ',\'ediDate\': ' + ediDate + ',\'hashString\' : ' + getSignData(ediDate + merchantID + amt + merchantKey).toString() + ',\'returnURL\': ' + returnURL + '}';
    'goodsName : ' + goodsName + ',amt : ' + amt + ',moid : ' + moid + ',buyerName : ' + buyerName + ',buyerEmail : ' + buyerEmail + ',buyerTel : ' + buyerTel + ',merchantID: ' + merchantID + ',ediDate: ' + ediDate + ',hashString : ' + getSignData(ediDate + merchantID + amt + merchantKey).toString() + ',returnURL: ' + returnURL;

  }
  getSignData(str) {
    List<int> list = str.codeUnits;
    var encrypted = sha256.convert(list);
    return encrypted;
  }

  String _text = "Http Example";
  void _fetchPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    setState(() {
      _text = response.body;
    });
  }

  void _createPost() async {
    final response = await http.post(
      MERCHANT_URL,
      body: jsonEncode(
        {
          'GoodsName': goodsName,
          'Amt': amt,
          'MID': merchantID,
          'EdiDate': ediDate,
          'Moid': moid,
          'SignData': getSignData(ediDate + merchantID + amt + merchantKey).toString(),
          'BuyerName': buyerName,
          'BuyerTel': buyerTel,
          'ReturnURL': returnURL,
        },
       /* {
          'merchantKey': merchantKey,
          'merchantID': merchantID,
          'ediDate': ediDate,
          'amt': amt,
          'returnURL': returnURL,
          'goodsName': goodsName,
          'moid': moid,
          'buyerName': buyerName,
          'buyerEmail': buyerEmail,
          'buyerTel': buyerTel,
        },*/
      ),
      headers: {'Content-Type': "application/json"},
    );

    final Post parsedResponse = Post.fromJSON(jsonDecode(response.body));
  }

  @override
  void initState() {
    super.initState();
    // _fetchPosts();
    _createPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_text),
      ),
    );
  }
}