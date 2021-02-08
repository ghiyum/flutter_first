import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';


class payment extends StatefulWidget {
  @override
  _payment createState() => _payment();
}
class _payment extends State<payment> {
  final String TAG = "NICE";
  final String MERCHANT_URL = "https://web.nicepay.co.kr/v3/v3Payment.jsp";//"https://web.nicepay.co.kr/demo/v3/mobileReq.jsp";

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
    index = '{"GoodsName": ' + goodsName +
        ',"Amt": ' + amt +
        ',"MID": ' + merchantID +
        ',"EdiDate": ' + ediDate +
        ',"Moid": ' + moid +
        ',"SignData": ' + getSignData(ediDate + merchantID + amt + merchantKey).toString() +
        ',"BuyerName": ' + buyerName +
        ',"BuyerTel": ' + buyerTel +
        ',"ReturnURL": ' + returnURL +
        '}';

    /* index =
    //'{\'goodsName\' : ' + goodsName + ',\'amt\' : ' + amt + ',\'moid\' : ' + moid + ',\'buyerName\' : ' + buyerName + ',\'buyerEmail\' : ' + buyerEmail + ',\'buyerTel\' : ' + buyerTel + ',\'merchantID\': ' + merchantID + ',\'ediDate\': ' + ediDate + ',\'hashString\' : ' + getSignData(ediDate + merchantID + amt + merchantKey).toString() + ',\'returnURL\': ' + returnURL + '}';
    'goodsName : ' + goodsName + ','
        'amt : ' + amt + ','
        'moid : ' + moid + ','
        'buyerName : ' + buyerName + ','
        'buyerEmail : ' + buyerEmail + ','
        'buyerTel : ' + buyerTel + ','
        'merchantID: ' + merchantID + ','
        'ediDate: ' + ediDate + ','
        'hashString : ' + getSignData(ediDate + merchantID + amt + merchantKey).toString() + ','
        'returnURL: ' + returnURL; */

  }
  getSignData(str) {
    List<int> list = str.codeUnits;
    var encrypted = sha256.convert(list);
    return encrypted;
  }


  @override
  void initState() {
    super.initState();
    SetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller){
              _webViewController = controller;
              _webViewController.postUrl(
                  url: MERCHANT_URL,
                  postData: Uint8List.fromList(index.codeUnits));
            },
          )
      ),
    );
  }
}