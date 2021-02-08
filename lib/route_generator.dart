import 'package:flutter/material.dart';

import 'package:eninetour/main.dart';
import 'package:eninetour/page/homepage.dart';
import 'package:eninetour/loginSNS.dart';
import 'package:eninetour/join.dart';
import 'package:eninetour/terms.dart';
import 'package:eninetour/certification.dart';
import 'package:eninetour/findlogin.dart';
import 'package:eninetour/detail_list_page.dart';
import 'package:eninetour/detail_tours.dart';
import 'package:eninetour/page/notice.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Main':
        return MaterialPageRoute(builder: (context) => Splash());
      case '/Home':
        return MaterialPageRoute(builder: (context) => Home());
      case '/Login':
        return MaterialPageRoute(builder: (context) => Login());
      case '/Welcome':
        return MaterialPageRoute(builder: (context) => Welcome());
      case '/Terms':
        return MaterialPageRoute(builder: (context) => Term());
      case '/Join':
        return MaterialPageRoute(builder: (context) => Join());
      case '/JoinMember':
        return MaterialPageRoute(builder: (context) => Join_MemberInfo());
      case '/EnineTerms':
        return MaterialPageRoute(builder: (context) => enineterms());
      case '/PersonalInfo':
        return MaterialPageRoute(builder: (context) => personalinfo());
      case '/OverseaTrip':
        return MaterialPageRoute(builder: (context) => overseatrip());
      case '/DomesticTravel':
        return MaterialPageRoute(builder: (context) => domestictravel());
      case '/Certification':
        return MaterialPageRoute(builder: (context) => Certify());
      case '/FindID':
        return MaterialPageRoute(builder: (context) => FindId());
      case '/LoginFindResultID':
        return MaterialPageRoute(builder: (context) => LoginFindResultID());
      case '/LoginFindResultPW':
        return MaterialPageRoute(builder: (context) => LoginFindResultPW());
      case '/LoginFindResultFail':
        return MaterialPageRoute(builder: (context) => LoginFindResultFail());
      case '/CertifyforNicePay':
        return MaterialPageRoute(builder: (context) => certifyforNicePay());
      case '/DetailList':
        return MaterialPageRoute(builder: (context) => DetailList(args));
      case '/DetailTours':
        return MaterialPageRoute(builder: (context) => DetailTours(args));
      case '/Notice':
        return MaterialPageRoute(builder: (context) => notice());

      default:
      //? in case no route has been specified [for safety]
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
