import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_string/random_string.dart';
import 'dart:convert';

import 'package:eninetour/data/user.dart';
import 'package:eninetour/data/signindata.dart';
import 'package:eninetour/join.dart';
import 'package:eninetour/findlogin.dart';

class DBConnection {
  static Future<void> logout() async {
    appcurrentUser.value = new Users();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
    return true;
  }

  static LoginCheck(var context, var autologin, var email, var pw) async {
    if(autologin == true){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('autologin', true);
    }

    Db _db;
    if (_db == null){
      try {
        _db = Db("mongodb://10.0.2.2:27017/item");
        await _db.open();
        print("dbconnected");
      } catch(e){
        print(e);
      }
    }

    var coll = _db.collection('users');
    var val = await coll.findOne({"email":email});
    if(val == null){
      // id 없음
    }
    else{
      var db_pwd = val["password"];
      if(db_pwd == pw){
        // 로그인 성공

        if(autologin == true){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('current_user', json.encode(val));

          appcurrentUser.value =
              Users.fromJSON(json.decode(await prefs.get('current_user')));
        }

        Navigator.pushNamed(context, '/Home');
      }
      else{
        // password 틀림
      }
    }
    _db.close();
  }

  static LoginCheckforSNS(var context, var sns, var email) async {
    Db _db;
    if (_db == null){
      try {
        _db = Db("mongodb://10.0.2.2:27017/item");
        await _db.open();
        print("dbconnected");
      } catch(e){
        print(e);
      }
    }

    var coll = _db.collection('users');
    var val = await coll.findOne({"email":email});
    if(val == null){
      //// id 없음: 회원가입페이지
      Term.sns = sns;
      Navigator.pushNamed(context, '/Terms');
    }
    else {
      Navigator.pushNamed(context, '/Home');
    }
    _db.close();
  }

  static Signin(var context) async {
    Db _db;
    if (_db == null){
      try {
        _db = Db("mongodb://10.0.2.2:27017/item");
        await _db.open();
        print("dbconnected");
      } catch(e){
        print(e);
      }
    }

    var coll = _db.collection('users');
    var val = await coll.insertOne({"name":SignInfo.name, "gender":SignInfo.gender, "email":SignInfo.email, "phone": SignInfo.phone, "dofor": SignInfo.dofor, "birth": SignInfo.birth, "password": SignInfo.password, "year": SignInfo.year, "sns": SignInfo.sns});
    if(val == null){
    }
    else{

      Navigator.pushNamed(context, '/Welcome');
    }
    _db.close();
  }

  static Future<bool> FindID(var name, var gender, var birth, var phone) async {
    Db _db;
    if (_db == null){
      try {
        _db = Db("mongodb://10.0.2.2:27017/item");
        await _db.open();
        print("dbconnected");
      } catch(e){
        print(e);
      }
    }

    var coll = _db.collection('users');
    var val = await coll.findOne({"name":name, "gender": gender, "birth": birth, "phone": phone});
    if(val == null){
      _db.close();
      return false;
    }

    else{
      var db_id = val["email"];
      FindData.id = db_id;
      _db.close();
      return true;
    }
  }

  static Future<bool> FindPWforEmail(var name, var gender, var email) async {
    Db _db;
    if (_db == null){
      try {
        _db = Db("mongodb://10.0.2.2:27017/item");
        await _db.open();
        print("dbconnected");
      } catch(e){
        print(e);
      }
    }

    var coll = _db.collection('users');
    var val = await coll.findOne({"name":name, "gender": gender, "email": email});
    if(val == null){
      _db.close();
      return false;
    }

    else{
      // 난수 얻기
      var newpassword =  randomAlphaNumeric(8);

      // 비밀번호 바꾸기
      val["password"] = newpassword;
      await coll.save(val);

      // 난수 띄워주기 위해 저장
      FindData.pw = newpassword;

      _db.close();
      return true;
    }

  }

}