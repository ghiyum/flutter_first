import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:eninetour/data/user.dart';
import 'package:eninetour/element/footer.dart';
import 'package:eninetour/payment.dart';

class DetailTours extends StatefulWidget {
  final dynamic item;
  DetailTours(this.item);

  @override
  _DetailTours createState() => _DetailTours();
}

class _DetailTours extends State<DetailTours>  with SingleTickerProviderStateMixin {
  var height, width;

  final _priceList = ['상품가격', '이벤트','클럽회원가'];
  var _selectedPrice = '상품가격';

  bool _hasBeenPressed = false;
  TabController _controller;


  List<String> _schedule = List();  // 하드코딩

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    _scheduleData();  // 하드코딩

    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: _buildTour(context),
            ),
            _buildTopBackButton(context),
          ],
        ),
      ),
      bottomNavigationBar:BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlineButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  });
                },
                child: Icon(
                  Icons.favorite_border,
                  color: _hasBeenPressed ? Colors.deepOrange : Colors.grey,
                )
            ),
            FlatButton(
                minWidth: 0.7 * width,
                color: Colors.blueAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {  //비회원처리하기, 수량처리
                  if(appcurrentUser.value == null){
                    Users user;
                    user.phone = '00000000';
                    user.email = '';
                    user.year = 1;
                    user.name = 'Gest';
                    user.birth = '';
                    user.sns = '';
                    user.password = '';
                    user.domestic = '';
                    user.gender = '';

                    goBootpayRequest(context, widget.item, appcurrentUser.value, 1 );
                  }
                  else
                    goBootpayRequest(context, widget.item, appcurrentUser.value, 1 );
                },
                child: Text(
                  '예약하기',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.3333333333333333,
                  ),
                ),),
          ],
        ),
      ),
    );
  }

  _buildTour(BuildContext context) {
    String price = NumberFormat('###,###,###,###').format(int.parse(widget.item['price'])).replaceAll(' ', '');

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 0.6 * height,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: _buildOverlayImage(),
                ),
              //  _buildBlogNameAndDetails(context),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  widget.item['title'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  widget.item['tag'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3DC2C6),
                  ),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 10, 20, 10),
                child: Divider(
                  color: Color(0xffEFEFEF),
                  thickness: 1.1,
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
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
                  padding: const EdgeInsets.only(bottom: 5.0),
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
                Container(
                  padding: EdgeInsets.only(right: 18, bottom: 5),
                  child: DropdownButton(
                    value: _selectedPrice,
                    items: _priceList.map(
                            (value) {
                              return DropdownMenuItem(
                                value: value,
                                  child: Text(value),);
                            }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPrice = value;
                      });
                      // 결제페이지
                    },
                  )
                ),
              ],),
              Container(
                padding: EdgeInsets.fromLTRB(17, 0, 20, 10),
                child: Divider(
                  color: Color(0xffEFEFEF),
                  thickness: 1.1,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                  width: 0.45 * width,
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: OutlineButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                      },
                      child: Text(
                        '이달의 카드 할인혜택',
                      ),),
                ),
                    Container(
                  width: 0.45 * width,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                    },
                    child: Text(
                      '마일리지 적립안내',
                    ),),
                ),
              ]),
              SizedBox(height: 30,),
              Container(
                child:  TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  controller: _controller,
                  tabs: [
                    Tab(
                      text: '상세일정',

                    ),
                    Tab(
                      text: '여행지정보',
                    ),
                    Tab(
                      text: '체크사항',
                    ),
                    Tab(
                      text: '상품평',
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.37 * height,
                child: new TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Container(
                        child: _detailSchedule(),
                    ),

                    // 두번째 탭바
                    Container(

                    ),

                    // 세번째
                    Container(),

                    // 네번째
                    Container(),
                  ],
                ),
              ),

              if(appcurrentUser.value.name != null)
                Footer('로그아웃', ''),
              if(appcurrentUser.value.name == null)
                Footer('로그인', '/Login'),

            ],)

        ],
      ),
    );
  }
  _detailSchedule(){
    DateTime now = new DateTime.now();

    return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.deepOrange,
                    size: 20,
                  ),
                ),
                Container(
                  child: Text(
                    ' 여행일정 변경에 관한 사전 동의안내',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      height: 1.3333333333333333,
                    ),
                  ),
                ),
              ]),
          Container(
            padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
            child: Text(
              '여행일정은 계약체결 시 예상하지 못한 부득이한 사정 등이 발생하는 경우 여행자의 사전동의를 거쳐 변경될 수 있음을 양지하시기 바랍니다.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                height: 1.3333333333333333,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 50,
            child: MaterialButton(
                color: Colors.red,
                onPressed: () async {
                  final List<DateTime> picked = await DateRagePicker.showDatePicker(
                      context: context,
                      initialFirstDate: new DateTime.now(),
                      initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),

                      firstDate: new DateTime(now.year),
                      lastDate: new DateTime(now.year + 5)
                  );
                  if (picked != null && picked.length == 2) {
                    print(picked);  // 선택된 것
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      '1일차 ' + widget.item['startdate'] + '  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 1.3333333333333333,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                )
            ),
          ),

          _buildSchedule(),
          ]
    );
  }
  _buildSchedule(){
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          width: width - 40,
          height: 35,
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          color: Color(0xff3DC2C6),
          alignment: Alignment.centerLeft,
          child: Text(
            '일정표',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.3333333333333333,
            ),
          ),
        ),
        Container(
          width: width - 40,
          height: 0.4 * height,
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return ScheduleItem(_schedule[index]);
            },
            itemCount: _schedule.length,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17, 0, 20, 10),
          child: Divider(
            color: Color(0xffEFEFEF),
            thickness: 1.1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding:  EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: ExpansionTile(
            title: Text("호텔", style: TextStyle(
              fontFamily: 'Roboto',
            ),),
            children: [

            ],),
        ),
        Container(
          padding:  EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: ExpansionTile(
            title: Text("교통편", style: TextStyle(
              fontFamily: 'Roboto',
            ),),
            children: [

            ],),
            ),
        Container(
          padding:  EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: ExpansionTile(
            title: Text("식사", style: TextStyle(
              fontFamily: 'Roboto',
            ),),
            children: [

            ],),
        ),
        Container(
          child: Image.asset('images/tour_detail_1.png'), // 가져오기로 변경하기
        ),
        SizedBox(height: 10,),
        Container(
            child: Image.asset('images/tour_detail_2.png'),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
  _buildOverlayImage() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Image.network(
              'https://1337.e9tour.com' + widget.item['coverimage']['url'],
          fit: BoxFit.cover,
        )),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
            //    Colors.black
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
        )
      ],
    );
  }

  _buildTopBackButton(BuildContext context) {
    return Positioned(
      top: 30.0,
      left: 10.0,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: IconButton(
          icon: Icon(
            Mdi.chevronLeft,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  _scheduleData(){

    _schedule.clear();
    var paragraph = '';
    String strSchedule = widget.item['schedule'];
    var element = strSchedule.split('\n');
    for(int i=0; i<element.length; i++){

      RegExp _numeric = RegExp(r'^-?[0-9]+$');

      if(element[i]!='' &&
          (_numeric.hasMatch(element[i].substring(0, 1))  ||
          _numeric.hasMatch(element[i].substring(0, 2))  )){ // 숫자

        if(paragraph != '')
          _schedule.add((paragraph + '\n'));

        paragraph = (element[i] + '\n');
      }
      else if(i == element.length) {
        paragraph += (element[i] + '\n');
        _schedule.add((paragraph + '\n'));
      }
      else
        paragraph += (element[i] + '\n');
    }
  //  _schedule.clear();
  //  _schedule.add('1. 미팅안내\n미팅시간       05월 04일 오후 18:35\n미팅장소       인천공항 제2여객터미널 3층 출국장 H카운터 옆\n여행사 미팅장소 E9투어 테이블');
  //  _schedule.add('2. 호놀룰루\n기내식 2회 [석식/조식]\n- 시차정보 : 한국보다 19시간 느림\n※ 입국절차 강화로 많은 시간이 소요될 수 있습니다.\n※ 상세 사항은 출발 전 상담원을 통해 안내드립니다.\n■ 미국 세관신고서 작성시 참고\n- 호텔명 : SHERATON WAIKIKI HOTEL\n- 호텔주소 : 2255 KALAKAUA AVENUE HONOLULU HI 96815\n- 전화번호 : 808-922-4422\n\n■ 착륙 후\n- 메인 터미널로 이동 > 2층으로 내려가 외국인(Visitor)입국심사\n - 1층으로 내려가 짐을 찾은 후 > 세관검사\n- 두군데의 출구 중 > 좌측 그룹게이트(Tour Group)가이드 미팅\n\n■ 호놀룰루 현지공항 미팅 정보\n피 켓 : E9투어\nE9투어 상품코드 고객님만 행사합니다.');
  //  _schedule.add('3. 오아후 시내\n하와이 주(州)정부 청사\n호놀룰루에 있는 하와이 상징 주정부 청사는 1969년 3월 15일완공된 블록식의 근대 건축물입니다. 중앙에는 천장 없이 개방되어1층 로비에서는 하늘을 볼 수 있습니다.\n\n카메하메하 대왕 동상\n카메하메하는 전사로 외로운 사람이라는 뜻을 가지고 있으며,매년 6월 11일은 대왕의 탄생 기념일로 정해져 화려한 퍼레이드가열리고 있습니다.\n\n이올라니 궁전\n침실, 무도회장을 비롯하여 하와이 최초 수세식 화장실 등이잘 보존되어 당시 왕조의 문화를 배울 수 있습니다.');
  //  _schedule.add('4. 하나우마베이 전망대\n해양생물 보호구역이자 인기있는 스노클링 장소\n하나우마 베이의 깨끗하고 맑은 바다에서 수영을 하며 각양각색의물고기와 다채로운 산호초를 탐험해 볼 수 있습니다.');
  //  _schedule.add('5. 호텔 투숙 및 휴식\nSHERATON WAIKIKI\n쉐라톤 와이키키 호텔(SHERATON WAIKIKI)은 세계적으로유명한 하와이의 와이키키 지역, 그중 가장 가운데 해변에 위치한호텔입니다.\n\n투어종료시간\n저녁 8시경 미팅장소에 다시 내려드립니다.');
  }
}

class ScheduleItem extends StatelessWidget {
  final String _schedule;

  ScheduleItem(this._schedule);
  var title;
  var content = '';

  Split(){
    title = _schedule.split('\n');

    for(int i=1; i<title.length; i++){
      content += (title[i]+'\n');
    }

  }

  @override
  Widget build(BuildContext context) {
    Split();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: MediaQuery.of(context).size.width - 40,
          height: 30,
          color: Color(0xFFE3E3E3),
          alignment: Alignment.centerLeft,
          child: Text(
            title[0],
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              height: 1.3333333333333333,
            ),
          ),
        ),
        Wrap(
          children: [
            Text(
              content,
              softWrap: true,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                height: 1.3333333333333333,
              ),
            )
          ],
        )
      ],
    );
  }
}