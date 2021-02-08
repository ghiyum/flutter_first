import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

import 'package:eninetour/data/user.dart';
import 'package:eninetour/data/tour.dart';
import 'package:eninetour/theme_card.dart';
import 'package:eninetour/element/footer.dart';
import 'package:eninetour/page/notice.dart';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// home
class Home extends StatefulWidget {
  @override
  _home createState() => _home();
}
class _home extends State<Home> with TickerProviderStateMixin{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController;
  var height;

  List<MyCategoryTabs> _catetabs = List();

  MyCategoryTabs _myHandler ;
  TabController _controller ;

  int _selectedBottomNaviIndex = 0;

  Future<http.Response> _responseBoard;

  @override
  void initState() {
    super.initState();
    getAutoLoginUser();
    getTours();
    getCategoryTabs(); // 카테고리 변경사항
    getClubBoard();  // 게시판 정보 가져오기

    _controller = new TabController(length: _catetabs.length, vsync: this);
    _controller.index = 1;
    _myHandler = _catetabs[1];
    _controller.addListener((){
      setState(() {
        _myHandler= _catetabs[_controller.index];
      });
    });

  }

  void _handleSelected() {
    setState(() {
      _myHandler= _catetabs[_controller.index];
    });
  }


  String setClubUserText (){
    if(appcurrentUser.value.name != null){
      return appcurrentUser.value.name + '님\n' + _myHandler.comment;
    }
    else{
      return _myHandler.comment;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        elevation: 0.0, // tabbar 경계라인
        title: new Text(_myHandler.logotxt, style: TextStyle(color: _myHandler.logocolor),),
        leading: new SvgPicture.asset('images/' + _myHandler.logo + '.svg'),
        backgroundColor: _myHandler.color1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45.0),
          child:Align(
            alignment: Alignment.center,
            child: Container(
              width: 0.65 * MediaQuery.of(context).size.width,
              child:TabBar(
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.transparent,
                        width: 0.0
                    ),
                  ),
                ),
                controller: _controller,
                tabs: <Tab>[
                  new Tab(child: _controller.index == 0 ? SvgPicture.asset('images/tab_club_enable.svg'): SvgPicture.asset('images/tab_club.svg')),
                  new Tab(child: _controller.index == 1 ? SvgPicture.asset('images/tab_trip_enable.svg'): SvgPicture.asset('images/tab_trip.svg')),
                  new Tab(child: _controller.index == 2 ? SvgPicture.asset('images/tab_benefit_enable.svg'): SvgPicture.asset('images/tab_benefit.svg'))
                ],
              ),),),),),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedBottomNaviIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedBottomNaviIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.dehaze),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.account_balance_wallet_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[

          // first tab
          ListView(
            // shrinkWrap: true,
            controller: scrollController,
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        height: 0.5 * MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:ExactAssetImage(
                                "images/home_club.png"),),
                        ),
                         /* decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xff271238),
                              Color(0xff271238),
                            ],
                          ),
                        ),*/
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              width: 0.5 * MediaQuery.of(context).size.width,
                              height: 0.5 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xff3DC2C6),
                                    Color(0xff026C80),
                                  ],
                                ),
                              ),
                              child:  Center(
                                child: FittedBox(
                                  child: Text(
                                    setClubUserText(),
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 21.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffffffff),
                                    ),),
                                ),
                              )
                          ),
                        ),
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(top:  0.36 * MediaQuery.of(context).size.height,),
                    child:  Center(
                      child: Text(
                        _myHandler.points + "P",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3DC2C6),
                        ),),
                    ),)
                ],),

              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "뜨는 이머징",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                  ),),
                      FlatButton(
                        minWidth: 50,
                        onPressed: () {
                          Themes _themes = new Themes(0, parsedResponseTheme9[0]['title']);
                          Navigator.pushNamed(context, '/DetailList', arguments: _themes);
                        },
                        child: new Icon(
                          Icons.more_vert,
                        ),),
                    ],
                  ),
                ),
              _build9themeCards(),
              _buildSlider(),
              if(appcurrentUser.value.name != null)
                Footer('로그아웃', ''),
              if(appcurrentUser.value.name == null)
                Footer('로그인', '/Login'),
            ],
          ),


          // second tab
          ListView(
            // shrinkWrap: true,
            controller: scrollController,
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 0.5 * MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xff1799F7),
                            Color(0xff30F3AB),
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: 0.5 * MediaQuery.of(context).size.width,
                          height: 0.5 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/01/20/00/30/maldives-1993704__340.jpg"),),
                          ),
                        ),),
                    ),),
                  Container(
                    padding: EdgeInsets.only(top:  0.33 * MediaQuery.of(context).size.height,),
                    child:  Center(
                      child: Text(
                        "요즘 뜨는"
                            "\n핫플레이스 감성여행",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),),
                    ),)
                ],
              ),

              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "나만의 스타일 여행",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                    FlatButton(
                      minWidth: 50,
                      onPressed: () {
                        Themes _themes = new Themes(3, parsedResponseTheme9[3]['title']);
                        Navigator.pushNamed(context, '/DetailList', arguments: _themes);
                      },
                      child: new Icon(
                        Icons.more_vert,
                      ),),
                  ],
                ),
              ),
              _build9themeCards(),
              _buildSlider(),
              if(appcurrentUser.value.name != null)
                Footer('로그아웃', ''),
              if(appcurrentUser.value.name == null)
                Footer('로그인', '/Login'),
            ],
          ),

          // third tab
          ListView(
            // shrinkWrap: true,
            controller: scrollController,
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 0.5 * MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xffF94F57),
                            Color(0xffFFBB5D),
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: 0.5 * MediaQuery.of(context).size.width,
                          height: 0.5 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://cdn.pixabay.com/photo/2016/08/11/22/16/sky-1587034__340.jpg"),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:  0.33 * MediaQuery.of(context).size.height,),
                    child:  Center(
                      child: Text(
                        "전세계 항공"
                            "\n비즈니스석 왕복 특가",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),),
                    ),),
                ],),

              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "이벤트 / 쿠폰 / 기획전 몰기",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                    FlatButton(
                      minWidth: 50,
                      onPressed: () {
                        Themes _themes = new Themes(6, parsedResponseTheme9[6]['title']);
                        Navigator.pushNamed(context, '/DetailList', arguments: _themes);
                      },
                      child: new Icon(
                        Icons.more_vert,
                      ),),
                  ],
                ),
              ),
              _build9themeCards(),
              _buildSlider(),
              if(appcurrentUser.value.name != null)
                Footer('로그아웃', ''),
              if(appcurrentUser.value.name == null)
                Footer('로그인', '/Login'),
            ],
          ),

        ],
      ),
    );
  }


  // 9theme
  _build9themeCards() {
    int index = 0;

  /*  if( _controller.index == 0)
      index = 0;
    else if( _controller.index == 1)
      index = 3;
    else if( _controller.index == 2)
      index = 6;*/

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 15.0),
      height: MediaQuery.of(context).size.height + 10,  //0.6 * MediaQuery.of(context).size.height,
      width: double.infinity,
      /*child: ListView.builder(
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          if( _controller.index == 0 && index > 2)
            return null;
          else if( _controller.index == 1 && !(index > 2 && index < 6) )
            return null;
          else if( _controller.index == 2 && index < 6)
            return null;

          return ThemeCard(index: index);
        },
        itemCount: tourList.length,
      ),*/
      child: Column(
        children: [
          ThemeCard(index: index),
          ThemeCard(index: index+1),
          ThemeCard(index: index+2),
        ],
      ),
    );
  }

  _buildSlider(){
    int cnt = 0;
    if(parsedResponseNotice != null)
      cnt = parsedResponseNotice.length;

    return CarouselSlider.builder(
      itemCount: cnt,
      options: CarouselOptions(
        aspectRatio: 10.0,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (ctx, index) {
        return  InkWell(
            child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                new Icon(
                  Icons.campaign_outlined,
                ),
                new Wrap(
                  children: [
                    Text('  ' + parsedResponseNotice[index]['title'],
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                       // fontSize: 17,
                      ),),
                    ])
              ],
            ),
          ),
          onTap: (){
            Navigator.pushNamed(context, '/Notice');
          },
        );
      },
    );
  }

  Future<Users> getAutoLoginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _autologin = (prefs.getBool('autologin') ?? false);
    if (_autologin && prefs.containsKey('current_user')) {

      appcurrentUser.value =
          Users.fromJSON(json.decode(await prefs.get('current_user')));
      String str = appcurrentUser.value.name;
    }
  }








  // 탭 정보: 클럽 여행 혜택
  getCategoryTabs() async {
    _catetabs = [
      new MyCategoryTabs(logo: "icn_logo_club", logotxt: "PAY", logocolor:Color(0xff3DC2C6),  comment: '행복 가득한\n봄날 되세요', points: '3000', color1: Color(0xff271238), ),
      new MyCategoryTabs(logo: "icn_logo",logotxt: "E9TOUR", logocolor:Color(0xffffffff),  comment: '요즘 뜨는 핫플레이스 감성여행', points: '0', color1: Color(0xff1799F7),  ),
      new MyCategoryTabs(logo: "icn_logo",logotxt: "E9TOUR", logocolor: Color(0xffffffff),  comment: '전세계 항공 비즈니스석 왕복 특가', points: '0', color1: Color(0xffF94F57),),
    ];
  }
}

class MyCategoryTabs {
  final String logo;
  final String logotxt;
  final Color logocolor;
  final String comment;
  final String points;
  final Color color1;

  MyCategoryTabs({this.logo, this.logotxt, this. logocolor, this.comment,this.points,this.color1,});
}

class WaveClipper extends CustomClipper<Path> {
  /// reverse the wave direction in vertical axis
  bool reverse;

  /// flip the wave direction horizontal axis
  bool flip;

  WaveClipper();

  splitFunction (Size size, double x) {
  // normalizing x to make it exactly one wave
    final normalizedX = x / size.width * 2 * pi;
    final waveHeight = size.height / 25;
    final y = 0.9 * size.height - sin(normalizedX) * waveHeight;

    return y;
  }

  @override
  Path getClip(Size size) {
    var path = Path();

    // move to split line starting point
    path.quadraticBezierTo(0, splitFunction(size, 0),0, splitFunction(size, 0));

    // draw split line
    for (double x = 1; x <= size.width; x++) {
      path.quadraticBezierTo(x, splitFunction(size, x), x, splitFunction(size, x));
    }

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
