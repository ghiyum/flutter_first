import 'package:flutter/material.dart';

import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';

import 'package:eninetour/data/tour.dart';
import 'package:eninetour/data/user.dart';

void goBootpayRequest(BuildContext context, Tours tour, Users user, int cnt) async {
  Payload payload = Payload();
  payload.androidApplicationId = '5fbc80ea2fa5c2002f03735c';
  payload.iosApplicationId = '5fbc80ea2fa5c2002f03735d';

  payload.pg = 'nicepay';
  // payload.method = 'card';
  payload.methods = ['card', 'phone', 'vbank', 'bank'];
  payload.name = tour.title; // 'testUser';
  payload.price = 1004.0;// tour.price.toDouble();
  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
//    payload.params = {
//      "callbackParam1" : "value12",
//      "callbackParam2" : "value34",
//      "callbackParam3" : "value56",
//      "callbackParam4" : "value78",
//    };

  User user = User();
  user.username = user.username; //"사용자 이름";
  user.email = user.email; //"user1234@gmail.com";
  user.area = ""; //"""서울";
  user.phone = user.phone; //"010-1234-4567";

  Extra extra = Extra();
  extra.appScheme = 'bootpaySample';

  Item item1 = Item();
  item1.itemName = tour.title; // "미키's 마우스"; // 주문정보에 담길 상품명
  item1.qty = cnt; //1; // 해당 상품의 주문 수량
  item1.unique = tour.goodsCode;// "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
  item1.price = tour.price.toDouble(); //1000; // 상품의 가격

  List<Item> itemList = [item1];

  BootpayApi.request(
    context,
    payload,
    extra: extra,
    user: user,
    items: itemList,

    onDone: (String json) {
      print('onDone: $json'); // 완료시 텍스트 변경
    },
    onReady: (String json) {
      //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
      print('onReady: $json');
    },
    onCancel: (String json) {
      print('onCancel: $json');
    },
    onError: (String json) {
      print('onError: $json');
    },
  );
}