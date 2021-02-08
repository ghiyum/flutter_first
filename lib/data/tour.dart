import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> parsedResponseTours;
List<dynamic> parsedResponseToursTh1;
List<dynamic> parsedResponseToursTh2;
List<dynamic> parsedResponseToursTh3;
List<dynamic> parsedResponseToursTh4;
List<dynamic> parsedResponseToursTh5;
List<dynamic> parsedResponseToursTh6;
List<dynamic> parsedResponseToursTh7;
List<dynamic> parsedResponseToursTh8;
List<dynamic> parsedResponseToursTh9;

getTours() async {
  parsedResponseToursTh1 = new List<dynamic>();
  parsedResponseToursTh2 = new List<dynamic>();
  parsedResponseToursTh3 = new List<dynamic>();
  parsedResponseToursTh4 = new List<dynamic>();
  parsedResponseToursTh5 = new List<dynamic>();
  parsedResponseToursTh6 = new List<dynamic>();
  parsedResponseToursTh7 = new List<dynamic>();
  parsedResponseToursTh8 = new List<dynamic>();
  parsedResponseToursTh9 = new List<dynamic>();


  final response  = await http.get('https://1337.e9tour.com/theme-nines');
  parsedResponseTours = jsonDecode(response.body);
  if(parsedResponseTours != null){
    parsedResponseTours.forEach((element){
      if(element['Theme'] == 'T1')
        parsedResponseToursTh1.add(element);
      else if(element['Theme'] == 'T2')
        parsedResponseToursTh2.add(element);
      else if(element['Theme'] == 'T3')
        parsedResponseToursTh3.add(element);
      else if(element['Theme'] == 'T4')
        parsedResponseToursTh4.add(element);
      else if(element['Theme'] == 'T5')
        parsedResponseToursTh5.add(element);
      else if(element['Theme'] == 'T6')
        parsedResponseToursTh6.add(element);
      else if(element['Theme'] == 'T7')
        parsedResponseToursTh7.add(element);
      else if(element['Theme'] == 'T8')
        parsedResponseToursTh8.add(element);
      else if(element['Theme'] == 'T9')
        parsedResponseToursTh9.add(element);
    });
  }

}

class Themes {
  Themes(
      this.index,
      this.title,
      );
  int index;
  String title;
}

List<Tours> tourList = List();

class Tours {
  Tours(
      this.thumbImage,

      this.showtitle,
      this.comment,

      this.title,
      this.detailComment,

      this.whenUse,
      this.price,

      this.package,
      this.reservationable,

      this.bannerImage,
      this.hashtag,
      this.schedule,

      this.goodsCode,
  );

  String thumbImage;

  String showtitle;
  String comment;

  String title;
  String detailComment;

  String whenUse;
  int price;

  String package;
  String reservationable;

  String bannerImage;
  String hashtag;
  String schedule;
  String goodsCode;
}