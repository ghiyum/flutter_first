import 'package:flutter/material.dart';

ValueNotifier<Users> appcurrentUser = new ValueNotifier(Users());

class Users {
 // String id;
  String name;
  String gender;
  String email;
  String phone;
  String domestic;
  String birth;
  String password;
  int year;
  String sns;

  String grade;

  Users();

  Users.fromJSON(Map<String, dynamic> jsonMap) {
    try {
     // id = jsonMap['id'].toString();
      name = jsonMap['name'] != null ? jsonMap['name'] : '';
      gender = jsonMap['gender'] != null ? jsonMap['gender'] : '';
      email = jsonMap['email'] != null ? jsonMap['email'] : '';
      phone = jsonMap['phone'] != null ? jsonMap['phone'] : '';
      domestic = jsonMap['dofor'] != null ? jsonMap['dofor'] : '';
      birth = jsonMap['birth'] != null ? jsonMap['birth'] : '';
      password = jsonMap['password'] != null ? jsonMap['password'] : '';
      year = jsonMap['year'] != null ? jsonMap['year'] : 0;
      sns = jsonMap['sns'] != null ? jsonMap['sns'] : '';
      grade = jsonMap['grade'] != null ? jsonMap['grade'] : '';
    } catch (e) {

      gender = '';
      name = '';
      email = '';
      phone = '';
      domestic = '';
      birth = '';
      password = '';
      year = 0;
      sns = '';
      grade = '';
    }
  }

  Object toMap() {}
}