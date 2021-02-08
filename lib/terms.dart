import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class enineterms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('이용약관',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),),
        centerTitle: true,
      ),
        body: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 10, left: 0),
            child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      '제1장 총 칙',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: const Color(0xff271238),
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '제1조 (목적)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '본 약관은 ㈜이나인투어(이하 "회사")가 온라인 사이트(이하 "웹사이트") 및 모바일 응용프로그램(이하 "어플리케이션") 에서 제공하는 서비스(이하 "서비스")를 이용자(이하 "이용자")가 이용함에 있어 "회사"와 "이용자" 간의 권리∙ 의 무, 이용조건, 기타 책임사항 등에 관한 사항을 규정함을 목적으로 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제2조 (정의)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 웹사이트: 상품 또는 용역의 거래를 위하여 "회사"가 제공하는 실시간 전자상거래 시스템과 '
                          '그 운영을 위한 웹사이트로 https://www.e9tour.com이 있으며, "회사"의 정책에 따라 추가/변동될 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. 어플리케이션: "이용자"가 단말기에 내려 받아 설치함으로써 단말기 상에서 "회사"가 제공하는 '
                          '서비스를 이용할 수 있도록 하는 프로그램입니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '3. 이용자: 본 규정에 따라 "회사"가 제공하는 서비스를 이용하는 "회원" 또는 "비회원"을 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '4. 회원: "회사"에 개인정보를 제공하고 "회원"자격을 부여 받은 자로 "회사"의 정보를 지속적으로 제공받으며 '
                          '"회사"에서 제공한 서비스를 이용할 수 있는 자를 말합니다. 만 14세 이상이면 누구나 가입할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '5. 비회원: "회원"에 가입하지 않고 "회사"가 제공하는 정보 및 서비스를 이용하는 자를 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '6. 구매자(대표 예약자): 상품 등을 구입할 의사를 밝힌 "회원"또는 "비회원"중에 개인 또는 단체를 대표하여 구매행위를 한 자를 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '7. 개인정보: 성명, 생년월일, 전자우편, 휴대전화번호 등 특정 개인을 식별할 수 있는 정보를 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '8. 아이디(ID): "회원"의 식별과 서비스 이용을 위해 "회원"이 직접 입력, 설정하여 "회사" 시스템에 등록한 인식 문자를 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '9. 비밀번호(Password): "회원" 본인의 적법한 접근인지를 확인하고 "회원"정보, 거래 내역 등의 비밀을 보호 하기 위해 "회원"이 직접 입력, 설정하여 "회사" 시스템에 등록한 영문, 숫자, 특수 문자의 조합을 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '10. 직접판매 상품: "회사(본사와 지사 포함)"의 "웹사이트" 및 "어플리케이션"을 통하여 직접 판매되는 것으로서 타 업체와 연동되지 않은 판매 상품을 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '11. 포인트(P): "회사"가 "회사"의 "직접판매 상품"을 구매한 "회원"에게 구매금액의 일정률을 포인트로 환산하여 제공하는 서비스를 말하며, "회사"가 정한 방법에 따라 사용할 수 있습니다. "포인트" 세부 방침은 "회사"의 정책에 따라 달라질 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '12. 고객 리뷰: 상품 구매 후 해당 상품에 대한 종합적인 평가를 기록한 글, 이미지, 영상물, 평가점수 등의 게시물을 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '13. 본인확인: 휴대전화 인증(또는 i-PIN 인증)을 통하여 "회원"이 본인인지 여부를 확인하는 것을 의미합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '14. 영업일: "회사"가 정상적으로 서비스를 제공한 날로서 토요일, 일요일 및 법정 공휴일을 제외한 날을 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '15. 제1항 ~ 14항 에서 정의되지 않은 용어의 의미는 관련 법령 및 일반적인 거래관행을 따릅니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제3조 (약관의 명시, 효력 및 변경)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"는 이 약관의 내용을 "이용자"가 알 수 있도록 "회사"의 서비스가 제공되는 "웹사이트" 및 "어플리케이션" 에 게시합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. "회사"는 합리적인 사유가 발생하면 약관의 규제에 관한 법률, 전자문서 및 전자거래 기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령 에 위배되지 않는 범위 안에서 본 약관을 개정할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '3. "회사"가 본 약관을 개정할 때에는 적용일자(이하 "효력발생일") 및 개정사유를 밝혀 그 효력발생일 15일 전부 터 효력발생일 전일까지 "웹사이트" 및 "어플리케이션"에 공지합니다. 단, "이용자"에게 불리하거나 중대한 사항의 변경은 효력발생일 30일 전부터 공지하며, 이메일(e-mail), 휴대폰 메시지(SMS) 등으로 "회원"에게 개별 통지합 니다. "회원"의 연락처 미 기재, 변경, 오 기입 등으로 개별 통지가 어려울 때에는 "웹사이트" 및 "어플리케이션" 에 공지를 하는 것을 개별 통지한 것으로 간주합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '4.이 약관에 동의하는 것은 정기적으로 "회사"가 운영하는 "웹사이트" 및 "어플리케이션"을 방문하여 약관의 개 정사항을 확인하는 것에 동의함을 의미합니다. 개정된 약관에 대한 정보를 알지 못하여 발생하는 "이용자"의 피 해에 대해 "회사"는 책임을 지지 않습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '5.다음과 같은 경우 "이용자"가 변경된 약관에 동의한 것으로 간주합니다.'
                      '\n①개정 약관의 효력발생일 전까지 이에 대한 반대의사를 적절한 방법을 통해 표시하지 않은 경우'
                      '\n②개정 약관의 효력발생일 이후에 특별한 의사 표시 없이 "서비스"를 이용할 경우',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '6. "회원"이 개정 약관의 효력발생일 전까지 반대의사를 표시한 경우, "회사"는 개정 약관의 내용을 적용할 수 없 으며, 이 경우 "회원"은 회원 탈퇴(이용 계약을 해지)를 요청할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '7. "이용자"는 약관 개정에 대하여 주의의무를 다하여야 하며, 변경된 약관의 부지로 인한 "이용자"의 피해는 "회 사"가 책임지지 않습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제4조(약관 외 준칙)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 이 약관에 밝히지 않은 사항은 전자거래기본법, 전자서명법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령의 규정 및 국내(외) 여행표준약관 등에 의합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. "회사"는 필요하면 특정 서비스에 적용될 사항(이하 "개별약관")을 정하여 이를 "웹사이트 및 "어플리케이션"을 통하여 공지할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '3. "회사"는 필요하면 서비스 이용과 관련된 세부적인 내용(이하 "이용 정책")을 정하여 이를 "웹사이트" 및 "어플 리케이션" 등을 통하여 공지할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '4.개별약관이나 이용 정책의 변경이 있으면 "회사"는 변경 내용의 효력발생일 15일 전에 "웹사이트" 및 "어플리 케이션"를 통하여 해당 변경 사항을 공지합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '5. "이용자"는 항상 개별약관이나 이용 정책의 내용에 변경이 있는지 여부를 주시하여야 하며, 변경사항의 공지가 있을 때에는 이를 확인하여야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      '제2장 회원 및 서비스',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: const Color(0xff271238),
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '제5조(서비스 개요 및 변경)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"가 "이용자"에게 제공하는 서비스는 아래와 같습니다.'
                      '\n①여행 관련 상품에 대한 판매 서비스'
                      '\n②구매계약이 체결된 재화 또는 용역의 배송'
                      '\n③"회사"가 운영하는 광고 및 프로모션 서비스'
                      '\n④기타 "회사"가 정하는 서비스',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. "회사"는 필요한 경우 전항의 서비스의 내용을 임의로 추가, 조정 등 변경하여 적용할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제6조 (서비스 기간 및 중지)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 서비스의 이용은 "회사"의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. "회원"의 서비스 기간은 "회사" 의 회원가입 승인일로부터 회원탈퇴 또는 자격 상실일 까지 입니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '3. "회사"는 다음 각 호에 해당하는 경우 서비스 제공을 중지 또는 제한할 수 있습니다.'
                          '\n①설비의 보수 등 공사로 인한 부득이한 경우'
                          '\n②전기통신사업법에 규정된 통신사업자가 전기통신서비스를 중지 했을 경우'
                          '\n③국가 비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제7조 (회원가입)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "이용자"는 "회사"가 제공하는 회원가입 신청 양식에 따라 정해진 사항을 기재한 후 필수 약관(이용약관, 개인 정보 수집 및 이용)에 동의함으로써 회원가입 신청을 할 수 있습니다. 단, 만 14세 미만의 미성년자의 경우에는 법정 대리인의 동의를 받아 본 약관에 동의하고 가입신청을 할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2. "회사"는 다음의 각 호 중 어느 하나에 해당하는 회원가입 신청에 대해서는 승인을 하지 않거나, 승인을 철회 또는 취소할 수 있습니다.'
                          '\n①필수 회원정보를 기입하지 아니한 경우'
                          '\n②신청한 자가 14세 미만인 경우'
                          '\n③"이용자"가 본 약관에 의하여 이전에 "회원" 자격을 상실한 적이 있는 경우'
                          '\n④타인의 명의를 도용하거나 등록 내용에 허위, 기재 누락, 오 기입 있을 경우'
                          '\n⑤"이용자"의 귀책사유로 인하여 승인이 불가능하거나 기타 제반 규정을 위반하여 신청하는 경우',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '3. 회원가입의 성립 시기는 "회사"의 이용 승낙 의사가 해당 서비스화면에 게시되거나, 이메일(E-mail) 또는 '
                          '기타 "회사"가 정하는 방법으로 이용신청자에게 도달한 시점으로 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '4. "회사"는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승인을 유보할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '5. "회사"는 "이용자"의 회원가입 시 필수 항목(아이디, 비밀번호, 휴대폰번호, 이름) 외에 '
                          '추가적인 정보(예: 성별, 생년월일, 추천인 아이디 등)를 요청할 수 있으며, 회원가입 신청자는 이러한 추가 정보의 제공을 거절할 수 있습니다. '
                          '추가적인 정보는 "회원"에게 유익한 정보를 제공하기 위해서만 사용됩니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '6. "회원"이 가입 화면 내 동의 란에 체크하는 것은 "회사"가 정하는 규정에 합법적으로 동의하는 것으로 간주됩 니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '7. 회원가입 신청서에 기입한 모든 정보는 실제 정보와 동일한 것으로 간주되며 오 기입, 변경 정보를 수정하지 않음으로 인해 발생하는 불이익은 "회원"이 부담하게 됩니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '8. "회사"의 합리적인 판단에 기하여 회원 신청자의 서비스 이용을 거부할 필요가 있다고 인정할 경우 "회사"는 회원가입신청을 거부할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제8조 (회원 탈퇴 및 자격상실)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회원"은 "회사"가 정한 방법으로 회원탈퇴를 요청할 수 있으며, "회사"는 요청을 받는 즉시 회원탈퇴를 처리합니다. '
                          '다만, 탈퇴 처리 시점에 "회원"의 구매 계약 절차가 완료되지 않은 경우, "회사"는 해당 구매 계약이 완료 된 후 탈퇴 처리합니다.'
                      '\n2. "회사"는 "회원"이 다음 각 호에 해당하는 행위를 한 경우 사전통지 없이 회원자격을 제한 및 정지하거나, '
                          '기간을 정하여 서비스 이용을 중지할 수 있습니다. 각 호에 해당하는 행위를 한 "회원"이 "구매자"일 경우, '
                          '"회사"는 해당 구매 계약을 취소하거나 해지하는 등의 조치를 할 수 있으며, "회원"은 이와 관련하여 "회사"가 입은 '
                          '직, 간 접적인 손해에 대하여 배상 책임을 부담할 수 있습니다.'
                            '\n①타인의 회원정보를 도용한 경우'
                          '\n②서비스 운영을 고의로 방해한 경우'
                      '\n③등록한 정보가 실제 정보와 상이한 경우'
                      '\n④공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우'
                      '\n⑤국익 또는 사회적 공익을 저해할 목적으로 서비스를 이용하는 경우'
                      '\n⑥"회사" 또는 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우'
                      '\n⑦사망한 경우'
                      '\n⑧이 약관 제19조(회원의 의무, 위반 시 회사의 조치)에 따른 의무를 이행하지 않은 경우'
                      '\n⑨휴면 회원이 된 후 4년이 경과할 때까지 회원 자격을 활성화하지 아니하는 경우'
                      '\n⑩"회사"의 서비스를 이용하여 구입한 재화 등의 대금, 기타 서비스 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우'
                      '\n⑪"회사"가 제공하는 포인트 및 쿠폰 등으로 경제적 이익을 편법으로 수취하고, 이 과정에서 회원 계정을 무단으로 사용하는 등 편법과 불법 행위가 적발될 경우'
                          '\n3. 전항에 의한 회원탈퇴 또는 자격상실 효력발생일은 아래 각 호와 같습니다.'
                          '\n①회원탈퇴일 또는 "회사"의 회원자격상실 통보일'
                          '\n②사망으로 인한 자격상실의 경우에는 그 사망일'
                          '\n4. "회사"는 본 조 제2항에 의하여 "회원"에 대한 서비스이용을 제한하고자 하는 경우에는 그 사유, '
                          '일시 및 기타 사항을 정하여 이 약관 에 따라 "회원"에게 통지합니다. '
                          '다만, "회사"가 긴급하게 이용을 정지할 필요가 있다고 판단하는 경우에는 그러하지 아니합니다.'
                          '\n5. 전항에 의하여 이용제한의 통지를 받은 "회원"은 그 이용제한 통지에 대하여 이의신청을 할 수 있습니다.'
                          '\n6. "회원"의 이의신청에 대하여 그 확인기간까지 이용 정지를 일시 연기할 수 있으며, 그 결과를 "회원"에게 통지합니다'
                          '\n7. "회원"의 이용정지 사유가 해소 된 경우 그 즉시 이용 정지를 해제 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제 9조(회원정보의 변경/관리)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회원"은 "회사"의"웹사이트" 및 "어플리케이션" 내 구비된 개인정보수정 기능을 통해 회원정보를 열람∙변경∙ 수정 할 수 있습니다.'
                          '\n2. "회원"은 회원가입 시 기재한 사항이 변경되었을 경우에는 상당한 기간 이내에 그 변경사항을 수정하여야 합 니다. 단, 이름, 아이디(ID) 등 변경할 수 없는 사항은 수정할 수 없습니다.'
                          '\n3. 회원 정보의 관리소홀, 부정사용, 정보를 변경하지 않아 발생하는 손해는 해당 "회원"이 부담하며, "회사"는 이 에 대해 아무런 책임을 지지 않습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제10조(회원에 대한 통지)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"가 "회원"에 대하여 통지하는 경우 "회원"이 제출한 이메일 주소 또는 휴대전화로 할 수 있습니다. 이 경우 "회원"의 통신 환경 또는 요금 구조 등에 따라 "회원"이 통지에 관한 통신비용(데이터 요금 포함) 등을 부담할 수 있습니다.'
                          '\n2. "회사"는 불특정다수의 "이용자"에게 통지하는 경우, "웹사이트" 및 "어플리케이션"초기화면에 7일 이상 게시함 으로써 개별 통지에 갈음할 수 있습니다. 다만, "회원" 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대 하여는 개별통지를 합니다.'
                          '\n3. 전항의 사유로 통지하는 경우, 부득이한 사정에 의해 사전 게시 기간이 단축되거나 생략될 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제11조(구매신청 및 계약의 성립)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "이용자"가 "재화 및 용역"등 판매 조건에 응하여 구매를 신청하고 "회사"가 그에 대하여 승낙의 의사표시를 함으로써 구매 계약이 체결됩니다.'
                      '\n2. "회사"는 전항의 구매 신청에 대하여 다음 각 호에 해당하는 경우 승낙을 거절할 수 있습니다.'
                          '\n①신청 내용 상 허위·기재 누락·오기가 있는 경우'
                      '\n②구매신청 내용이 현행법령이나 "회사"의 규정에 부적합한 경우'
                      '\n③미성년자가 법정대리인의 동의 없이 재화를 구매하는 경우'
                          '\n3. "이용자"는 구매한 상품에 대하여 구매를 취소하거나 변경을 요청할 수 있으며, 이 경우 별도의 수수료가 발생할 수 있습니다.'
                          '\n4. "회사"는 "이용자"가 구매 대금을 결제할 수 있는 방법을 제공합니다.'
                          '\n5. 구매 계약을 체결한 "이용자"는 구매 대금의 결제와 관련하여 자신이 입력한 정보에 대한 책임 및 불이익을 전적으로 부담하여야 합니다.'
                      '\n6. 구매 계약을 체결한 "이용자"가 계약을 체결한 후 일정 기간 내에 대금을 결제하지 않을 경우 "회사"는 "이용자"의 동의 없이 그 계약을 취소할 수 있습니다.'
                          '\n7. "회사"는 "이용자"가 구매 계약 체결 내용을 확인할 수 있도록 조치하며, 구매계약의 취소 방법 및 절차를 안내합니다.'
                      '\n8. "회사"는 구매계약에 대하여 다음 각 호 중 하나를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래 진행을 중지하거나, 확인이 불가한 거래는 취소할 수 있습니다.'
                      '\n①"이용자"가 대금 결제 시 사용한 결제 수단에 대한 정당한 사용권한을 보유하였는지 여부'
                      '\n②"이용자"가 구매 자격을 충족하였는지 여부',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제12조 (결제방법)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사" 의 "웹사이트" 및 "어플리케이션"에서 판매되는 상품을 구매한 "이용자"는 "회사"가 정한 다음 각 호의 방식 중 하나를 선택하여 대금을 결제할 수 있습니다. '
                          '단, 제3호의 포인트 결제는 다른 결제 방식과 함께 사용할 수 있습니다.'
                          '\n①선불카드, 직불카드, 신용카드 등의 카드 결제'
                          '\n②계좌이체(온라인 무통장입금, 가상계좌)'
                          '\n③포인트 결제'
                          '\n④상품권 결제'
                          '\n⑤기타 "회사"가 정한 결제방식',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제13조 (청약철회)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"와 구매 계약을 체결한 "구매자"는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. 단, 국내(외) 여행 표준약관, 특별약관에 따라 별도의 취소수수료가 부가될 수 있습니다.'
                          '\n2. "구매자"는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 청약 철회를 할 수 없습니다.'
                      '\n①구매자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우. (다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)'
                      '\n②재화의 일부가 누락된 경우 (예: 사은품)'
                      '\n③구매자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우'
                      '\n④시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우'
                      '\n⑤복제가 가능한 재화의 포장을 훼손한 경우 (예: 서적, CD, 지도 등)'
                      '\n3. 제2항 2호, 3호 내지 제5호의 경우에 "회사"가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 "구매자"의 청약철회 등이 제한되지 않 습니다.'
                      '\n4. 구매자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 상세페이지내용과 다르거나 계약 내용과 다르 게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      '제3장 책임과 의무',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: const Color(0xff271238),
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '제14조 (회사의 의무)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"는 법령과 이 약관이 금지한 행위를 하지 아니하며, 이 약관이 정하는 바에 따라 지속적이고, 안정적인 서비스를 제공하는 데 최선을 다하도록 하겠습니다.'
                      '\n2. "회사"는 "웹사이트" 및 "어플리케이션"을 통해 제공하는 "상품 등"에 대하여 표시·광고의 공정화에 관한 법률 에서 정한 부당한 표시, 광고행위를 하지 않겠습니다.'
                      '\n3. "회사"는 "웹사이트" 및 "어플리케이션"에 대한 공정하고 건전한 운영을 통하여 전자상거래질서를 유지하고, 지속적인 연구·개발을 통하여 양질의 서비스를 제공하도록 노력하겠습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제15조(회원의 의무, 위반 시 회사의 조치)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회원"은 관련 법령, "회사"가 규정에서 정한 사항 및 주의사항으로서 고지한 내용을 준수하여야 하며, "회사" 의 정상적 업무를 방해하는 행위를 하여서는 아니 됩니다.'
                      '\n2. "회원"은 자신의 아이디(ID) 및 비밀번호에 대한 관리 책임을 가지며, 어떠한 경우에도 자신의 아이디(ID) 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다."회사"의 귀책사유 없이 발생한 ID 및 비밀번호의 유출, 양도, 대여로 인하여 발생한 손해에 대하여, "회사"는 아무런 책임을 지지 않습니다.'
                      '\n3. "회원"은 자신의 아이디(ID) 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "회사"에 통보하고 "회사"의 안내가 있는 경우에는 그에 따라야 합니다.'
                      '\n4. "회원"은 가입신청 시 사실에 입각하여 정직하고 성실하게 가입신청서를 작성하여야 하며, 기재한 사항에 대한 변경사유가 발생하는 경우 사실에 맞게 변경해야 합니다. 만일 변경사유가 발생하였음에도 불구하고 변경 하지 않아 발생하게 되는 모든 문제에 대해서는 "회원"이 책임을 부담하게 됩니다.'
                      '\n5. "회원"은 서비스의 이용과정에서 습득한 정보를 "회사"는 사전 동의 없이 임의로 복사·복제·변경해서는 아니 되며, 기타 영리목적으로 활용하여서도 안 됩니다.'
                      '\n6. "회원"은 전항의 행위 외에도 다음 각 호의 행위를 하여서는 안 됩니다.'
                      '\n①타 "회원" 또는 제3자를 비방하여 명예를 손상시키는 경우'
                      '\n②타 "회원"의 계정 및 개인정보를 부정하게 사용하는 경우'
                      '\n③제3자의 저작권 등 기타 권리를 침해하는 경우'
                      '\n④공공질서 및 미풍양속에 위반되는 내용을 타인에게 유포하는 경우'
                      '\n⑤범죄와 결부되거나 주제에 관계없는 광고성 내용을 기재한 경우'
                      '\n⑥포인트의 부정 적립·사용 등 포인트 서비스를 부정한 방법·목적으로 이용한 경우'
                      '\n⑦기타 관계법령에 위반 된다고 판단되는 경우'
                      '\n7. "회사"는 본 조에 해당하는 행위를 한 "회원"에게 사전통지 없이 이용을 제한할 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제16조(지식재산권의 귀속 및 이용)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"가 작성한 저작물에 대한 지식재산권은 "회사"에 귀속됩니다.'
                          '\n2. "회원"은 "웹사이트" 및 "어플리케이션"을 통하여 얻은 정보 중 "회사"에게 지적재산권이 귀속된 정보를 "회사" 의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용 하게 하여서는 안 됩니다.'
                          '\n3. "이용자"는 "고객 리뷰"및 사진, 글, 정보, (동)영상, "회사"에 대한 의견이나 제안 등 콘텐츠(이하 \'게시물\')를 " 회사"서비스 내에 게시할 수 있으며, 이러한 게시물에 대한 저작권을 포함한 지적재산권은 "이용자"가 계속하여 보유합니다.'
                          '\n4. "이용자"가 "회사"서비스 내에 게시물을 게시하는 경우, 해당 게시물이 "회사’가 제공하는 서비스에 노출될 수 있고 이에 필요한 범위 내에서 사용, 저장, 수정, 복제, 공중 송신, 전시, 배포 등의 방식으로 이용할 수 있도록 사용을 허락하는 라이선스를 "회사"에게 제공하게 됩니다. 일부 서비스에서는 "이용자"가 제공한 콘텐츠에 접근하 거나 이를 수정 또는 삭제하는 방법을 제공할 수 있습니다. 또한 "이용자"가 일부 서비스에서는 제공된 콘텐츠에 대한 "회사"의 사용 범위를 제한할 것을 요청할 수 있습니다.'
                          '\n5. "회원"이 이용계약 해지를 한 경우에도 타인에 의해 보관, 담기 등으로 재 게시 되거나 복제된 게시물, 타인의 게시물과 결합되어 제공되는 게시물, 공용 게시판에 등록된 게시물 등은 삭제되지 않습니다.'
                          '\n6. "회사"는 "이용자"가 게시하거나 등록한 게시물이 다음 각 호에 해당된다고 판단되는 경우에 사전통지 없이 삭 제 또는 임시 조치할 수 있고, 이에 대하여 "회사"는 어떠한 책임도 지지 않습니다. 다만, "회사"가 모든 게시물 을 검토할 의무가 있는 것은 아니며, 타인이 "이용자"의 권리를 침해하였다면, 고객센터를 통해 게시중단 요청에 대한 도움을 받을 수 있습니다.'
                          '\n7. "회사"는 "회원"이 게시하거나 등록한 게시물이 다음 각 호에 해당한다고 판단되는 경우에 사전통지 없이 삭제 또는 임시 조치할 수 있고, 이에 대하여 "회사"는 어떠한 책임도 지지 않습니다.'
                          '\n①다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우'
                      '\n②공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우'
                      '\n③불법복제 또는 해킹을 조장하는 내용인 경우'
                      '\n④회사로부터 사전 승인 받지 않고 상업광고, 판촉 내용을 게시하는 경우'
                      '\n⑤개인 간 금전거래를 요하는 경우'
                      '\n⑥범죄적 행위에 결부된다고 인정되는 경우'
                      '\n⑦회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우'
                      '\n⑧타인의 계정정보, 성명 등을 무단으로 도용하여 작성한 내용이거나, 타인이 입력한 정보를 무단으로 위변조한 내용인 경우'
                      '\n⑨사적인 정치적 판단이나 종교적 견해의 내용으로 회사가 서비스 성격에 부합하지 않는다고 판단하는 경우'
                      '\n⑩동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우'
                      '\n⑪회사에서 규정한 게시물 원칙에 어긋나거나, 게시물을 작성하는 위치에 부여된 성격에 부합하지 않는 경우'
                      '\n⑫기타 관계법령에 위배된다고 판단되는 경우',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제17조(개인정보의 변경, 수집, 보호)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"는 "이용자"로부터 정보를 수집할 경우 서비스의 제공 및 계약 이행에 필요한 최소한의 정보만을 수집합 니다.'
                          '\n2. "회사"는 서비스 이용 과정에서 "이용자"가 직접 제공한 정보 외에도 개인정보 보호 등 관련 법령에서 정한 절 차에 따라 그 밖의 정보를 수집 및 이용 또는 제3자에게 제공할 수 있습니다. 이 경우 회사는 관련 법령에 따라 회원으로부터 필요한 동의를 받거나 관련 법령에서 정한 절차를 준수합니다. 링크된 사이트 및 서비스를 제공하 는 제3자의 개인정보 처리에 대해서는 해당 사이트 및 제3자의 개인정보처리방침을 확인할 책임이 "회원"에게 있 으며, 회사는 이에 대하여 책임을 부담하지 않습니다.'
                          '\n3. "회사"는 관련법령이 정하는 바에 따라서 "이용자"의 개인정보를 보호하기 위하여 노력하며, "이용자"의 개인정 보를 보호하기 위한 정책을 수립하고 개인정보보호 책임자를 지정하여 이를 게시합니다.'
                          '\n4. "이용자"의 개인정보보호는 관련 법령 및 "회사"이 정하는 개인정보처리방침에서 정한 바를 따릅니다.'
                          '\n5. "회사"는 "회원"이 선택한 정보유지기간(1년, 3년, 5년, "회원"탈퇴 시까지)에 따라 이용 내역이 없는 "회원"의 개인정보를 다른 "회원"의 개인정보와 분리하여 휴면회원으로 저장·관리합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      '제4장 통신판매중개 서비스',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: const Color(0xff271238),
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '제18조 (서비스의 종류)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '회사에서 회원에게 제공하는 서비스의 종류는 다음과 같습니다.'
                        '\n\n1. E-Commerce 서비스: 회사가 “웹사이트” 및 "어플리케이션"을 통하여 회원 및 회사간에 상품의 매매가 이루어질 수 있도록 온라인 거래 장소를 제공하는 서비스 및 관련 부가서비스를 말합니다.'
                      '\n①판매 관련 업무지원 서비스'
                      '\n②제휴 관련 업무지원 서비스'
                      '\n③구매 관련 지원 서비스'
                      '\n④계약체결, 결제 지원 및 결제대금 보호 서비스'
                      '\n⑤상담 대행 서비스'
                      '\n⑥상품 콘텐츠 제작 대행 서비스'
                      '\n⑦상품검색정보 서비스'
                      '\n⑧기타 전자상거래 관련 서비스'
                      '\n⑨광고 및 프로모션 서비스'
                      '\n기타 서비스 : 상품문의게시판 서비스, 구매자 판매자 간의 1:1 메신저 서비스, 상품평, 전문가 리뷰 등 기타 정보제공 서비스, 회사가 직접 또는 제휴사와 공동으로 제공하는 텔레마케팅(TM), 이벤트 서비스를 말합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제19조 (대리행위 및 보증인의 부인)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '회사에서 회원에게 제공하는 서비스의 종류는 다음과 같습니다.'
                          '\n1. 회사는 구매자와 판매자 간의 자유로운 상품의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로 구매자 또는 판매자를 대리하지 않으며, '
                          '회원 사이에 성립된 거래와 관련된 책임과 회원이 제공한 정보에 대한 책임은 해당 회원이 직접 부담하여야 합니다.'
                          '\n2. 회사는 “웹사이트” 및 "어플리케이션"을 통하여 이루어지는 구매자와 판매자 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, '
                          '등록 상품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 '
                          '또는 적법성 등 일체를 보증하지 않습니다. 다만, 등록된 상품 관련 정보가 법규 위반이나 저작권 침해가 명백한 경우, 또는 저작권 등 권리를 침해 받았다고 주장하는 자가 '
                          '그 침해의 정지ㆍ예방을 요청하는 경우 회사는 당사자간의 분쟁이 해결되어 권리관계가 명확해질 때까지 해당 상품에 대한 삭제, 수정 또는 미노출 처리할 수 있습니다.'
                          '\n3. 회사는 구매자와 판매자간의 거래의 안전성과 신뢰성을 높이는 도구만을 개발하여 제공합니다. 단, 회사가 판매하는 직매입 상품의 경우 구매자에 대하여 회사는 판매자의 지위를 갖게 됩니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제20조 (구매자의 서비스 이용)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 구매자는 구매의사 없이 판매자의 상품에 악의적인 판매방해행위(구매-취소 반복행위, 허위예약 등)통하여 상품 가격을 올리거나 구매의사를 표시하여 판매자의 상품판매 기회를 방해하거나 다른 구매자의 구매기회를 방해한 것이 적발되면 회사는 해당 이메일(E-mail)[해당 이메일(E-mail)과 동일인 소유로 확인되는 이메일(ID) 포함]에 대하여 회원자격을 정지하는 등의 조치를 할 수 있습니다.'
                      '\n2. 구매자는 상품을 구매하기 전에 반드시 판매자가 사이트 내에 작성한 상품의 상세 내용과 거래의 조건을 정확하게 확인해야 합니다. 구매하려는 상품의 내용과 거래의 조건을 확인하지 않고 구매하여 발생한 모든 손실과 손해는 구매자 본인에게 있습니다.'
                      '\n3. 구매자는 상품의 상세 내용과 거래의 조건 등에 관한 내용을 판매자에게 확인하기 위하여 회사가 제공하는 상품문의서비스를 이용할 수 있습니다.'
                      '\n4. 구매자는 이 약관과 회사가 서비스 화면에서 알리는 내용을 지켜야 하며, 약관과 알리는 내용을 위반하거나 이행하지 않아서 발생하는 모든 손실과 손해에 대해 책임을 집니다.'
                      '\n5. 회사는 판매자가 등록한 상품의 내용과 거래조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 구매자는 스스로 책임지고 상품을 구매해야 합니다.'
                      '\n6. 구매자는 구매한 상품에 청약철회의 원인이 발생하면 수령한 상품을 임의로 사용하거나 훼손되도록 방치해서는 안 됩니다. 청약철회 상품의 임의사용이나 상품보관의 미흡으로 상품이 훼손되었을 때에는 그에 합당한 비용을 부담하여야 합니다.'
                      '\n7. 구매자는 판매자와 상품매매 절차에서 분쟁이 발생하면 분쟁의 해결을 위하여 성실히 임해야 하며, 분쟁해결 과정에서의 불성실 등 구매자의 귀책사유로 판매자와 회사에 손실과 손해가 발생될 경우 그에 대한 모든 책임은 구매자에게 있음을 확인합니다.'
                      '\n8. 구매자가 상품을 구매할 때는 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단을 임의로 사용 해서는 안 됩니다. 타인의 결제수단을 임의로 사용하여 발생하는 회사, 결제수단 소유자, 판매자의 손실과 손해에 대한 모든 책임은 구매자에게 있습니다.'
                      '\n9. 매매대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 부담하여야 합니다.'
                      '\n10. 회사는 구매자가 매매대금 결제 때 사용한 결제수단에 대해 정당한 사용권한이 있는지 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나 해당 거래를 취소할 수 있습니다.'
                      '\n11. 회사는 구매자에게 서비스가 안전하게 제공 될 수 있도록 각종 설비와 자료를 관리해야 하며, 서비스가 제공 목적에 맞게 이용되고 있는지 확인하고 구매자에게 이용 목적에 위반되는 부분이 있는 것으로 확인되면 사유의 소명을 요청할 수 있습니다.'
                      '\n12. 회사가 구매자의 서비스 이용 편의를 높이기 위해 제휴업체로부터 정보를 제공받아 게재하거나 제3자가 제공하는 방식으로 “웹사이트” 및 "어플리케이션"내 또는 링크 방식으로 참조용 정보나 콘텐츠를 제공할 수 있으며, 구매자는 상품 구매 때 자신의 판단과 책임으로 결정하여 구매하여야 합니다.'
                      '\n13. 만 14세 미만의 미성년자는 “웹사이트” 및 "어플리케이션"에서 판매되는 모든 상품의 구매가 불가능합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제21조 (결제대금 보호서비스의 이용)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 회사는 e커머스 서비스의 신뢰성을 높이고 회원 간에 안전한 거래가 이루어질 수 있도록 결제대금 보호 서비스를 제공합니다. 결제대금 보호 서비스란, 매매계약이 체결되고 구매자가 대금을 결제 하였을 경우, 구매자가 판매자로부터 해당 상품을 받았다면 회사는 미리 정한 서비스 이용료를 공제한 후 해당 판매자에게 대금을 정산해 주고, 구매자가 판매자로부터 상품을 제공받지 못하여 구매자가 환불을 요청하였을 경우 구매자가 결제한 금액을 회사가 구매자에게 환불해주는 서비스를 말합니다.'
                      '\n2. 결제대금 보호 서비스는 “웹사이트” 및 "어플리케이션"에서 “회사”가 통신판매중개형태로 판매하는 일부 상품에 적용 됩니다.'
                      '\n3. 결제대금 보호 서비스는 회원 간에 이루어지는 상품매매의 안전성과 신뢰성을 높이고, 상품을 인수하기 전에 대금을 결제해야 하는 구매자를 보호하기 위해 제공합니다.'
                      '\n4. 회사에서 제공하는 결제대금 보호 서비스는 판매자나 구매자를 대리하는 것이 아니며, 상품의 매매와 관련하여 판매자나 구매자의 의무를 대행하는 것도 아닙니다.'
                      '\n5. 회사의 결제대행 서비스를 통하여 상품구매대금을 결제하는 과정에서 발생하는 송금수수료 등은 대금을 송금하는 구매자가 부담해야 합니다.'
                      '\n6. 결제대금 보호 서비스를 제공하는 과정에서 회사가 결제대금을 보관하여 이자 등이 발생했을 때 구매자는 회사에 그 반환을 청구할 수 없습니다.'
                      '\n7. 결제대금 보호 서비스를 이용하는 구매자는 수취확인기간내에 회사에 수취확인, 반품 등의 의사표시를 해야 합니다.'
                      '\n8. 구매자에게 수취확인의 의사가 있거나 수취확인의 의사가 있는 것으로 간주하는 상황이 발생하면 결제대금 보호 서비스는 종료됩니다.'
                      '\n9. 수취확인기간 내에 구매자가 반품의 의사표시가 없으면 회사는 구매자에게 수취 확인의 의사가 있는 것으로 간주합니다.'
                      '\n10. 회사는 구매자에게 수취확인의 의사가 있거나 수취확인의 의사가 있다고 간주하면 ’전자상거래 등에서의 소비자보호에 관한 법률’의 관련 규정에 따라 관련 대금을 상품의 판매자에게 송금할 수 있습니다.'
                      '\n11. 결제대금 보호 서비스가 종료된 이후에 청약철회, 취소, 해제, 무효 등의 사유가 발생한다면 구매자는 판매자와 직접 청약철회, 취소, 해제 및 결제대금 환불 등에 관한 절차를 진행해야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제22조 (배송 및 거래완료)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 배송 소요기간은 입금이 확인된 날의 다음 날을 기산일로 하여 배송이 완료되기까지의 기간을 말합니다. 공휴일과 기타 휴무일 또는 천재지변 등 불가항력의 사유가 발생하면 그 해당 기간은 배송 소요 기간에서 제외됩니다.'
                          '\n2. 배송과 관련하여 판매자와 구매자, 배송업체, 금융기관 등의 사이에 분쟁 등이 발생하면 관련 당사자가 해결해야 합니다. 회사는 이에 관여하지 않으며 어떠한 책임도 부담하지 않습니다.'
                          '\n3. 수취확인이 이루어진 이후에 상품의 하자 등 결제대금의 환불사유가 발생하면 회사는 이에 개입하지 않습니다. 수취확인 이후에 발생하는 판매자와 구매자 간 모든 분쟁은 거래 당사자인 판매자와 구매자가 해결해야 합니다.'
                          '\n4. 수취확인기간 내에 구매자에게서 수취확인 또는 반품에 대한 의사표시가 없으면 회사는 해당 거래에 대하여 수취확인의 의사가 있는 것으로 간주하여 다음 영업일에 자동구매확정으로 처리(이하 “자동구매확정”)할 수 있습니다. 다만, 수취확인 기간 내에 구매자가 실제 상품을 수령하지 못했다면 구매자는 상품 미도착 신고를 할 수 있습니다.'
                          '\n5. 자동수취확인 처리가 완료되면, 회사는 보관 중인 결제대금 중 판매자에게 지급할 상품판매대금을 판매자가 지정한 방법으로 지급할 수 있습니다.'
                          '\n6. 자동수취확인이 이루어졌다면 구매자는 상품 미수령, 반품 등의 사유로 회사에 이의를 제기할 수 없으며, 상품구매대금의 환불, 상품의 반품 등 모든 문제는 판매자와 직접 해결해야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제23조 (반품/환불/취소)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. ’전자상거래 등에서의 소비자보호에 관한 법률’ 제17조에 따라 구매자는 상품을 배송받은 날로부터 7일 이내에 반품을 요청할 수 있으며, 반품에 관한 일반적인 사항은 ’전자상거래 등에서의 소비자보호에 관한 법률’ 등 관련 법령이 판매자가 제시한 조건보다 우선합니다. 단, 다음 각 호의 경우에는 구매자가 반품을 요청할 수 없습니다.'
                      '\n①구매자의 귀책사유로 말미암아 상품이 훼손된 경우'
                      '\n②구매자의 사용 또는 일부 소비로 말미암아 상품의 가치가 현저히 감소한 경우'
                      '\n③시간이 지나 재판매가 어려울 정도로 상품의 가치가 현저히 감소한 경우'
                      '\n④복제가 가능한 상품의 포장을 훼손한 경우'
                      '\n⑤기타 구매자가 환불을 요청할 수 없는 합리적인 사유가 있는 경우'
                      '\n2. 회사는 구매자로부터 반품의 의사표시를 접수하면, 즉시 그러한 사실을 판매자에게 통보합니다.'
                      '\n3. 반품에 필요한 왕복 배송비와 기타 필요한 비용은 귀책사유가 있는 쪽에서 부담합니다.'
                      '\n4. 반품을 신청할 때 반품송장번호를 기재하지 않으면 반품처리와 환불이 지연될 수 있습니다.'
                      '\n5. 배송상의 문제로 구매자가 손해를 보았을 때 그에 대한 책임은 해당 배송업체를 지정한 판매자에게 있습니다.'
                      '\n6. 회사가 구매자의 구매대금 결제 확인에 대해 통지한 후 판매회원이 상당 기간 구매자의 주문 정보를 확인하지 않거나 배송 절차를 이행하지 않아 구매자가 거래 취소를 요구하면 회사는 해당 거래를 취소할 수 있으며, 거래가 취소되면 보관 중인 상품 구매대금은 구매자에게 환불됩니다. 아울러, 회사는 개별적인 정책으로 구매자의 요구 없이도 자동 환불처리 등의 조치를 할 수 있으며 그럴 경우 미리 해당 내용을 구매자에게 공지합니다.'
                      '\n7. 회사는 판매자가 구매자의 반품에 대한 사실확인 진행절차에 적극적으로 임하지 않거나 지연하면 구매자에게서 반품의 원인을 파악한 후 해당 거래를 취소하여 구매자에게 보관 중인 결제대금을 환불할 수 있습니다.'
                      '\n8. 회사는 구매자의 반품요청이 정당하지 않다고 판단하면 구매자의 의사표시를 취소하여 보관 중인 결제대금을 판매자에게 지급할 수 있습니다. 또한, 구매자의 반품이 접수된 날로부터 14일이 지날 때까지 이미 수령한 상품을 판매자에게 반환하지 않거나 전화, 이메일(E-mail) 등으로 연락되지 않으면 반품의 의사를 철회한 것으로 간주하여 보관 중인 결제대금을 판매자에게 지급할 수 있습니다.'
                      '\n9. 확인된 거래가 취소되어 결제대금을 환불할 경우는 회사는 거래가 취소된 날로부터 2영업일 이내에 구매자에게 환불에 필요한 조치를 합니다. 신용카드로 결제했을 때는 환불을 요청한 즉시 결제 승인이 취소됩니다.'
                      '\n10. 카드결제로 구매한 건의 환불은 카드결제 취소를 통해서만 가능하며, 어떠한 경우에도 현금잔고로 환불되지 않습니다.'
                      '\n11. 배송요청 중 상태에서는 즉시 취소처리가 완료되는 것이 원칙이나 이미 상품이 발송되었다면 발송된 상품의 왕복 배송비는 구매자가 부담해야 합니다. 또한 취소수수료 부과상품의 경우 구매상품의 취소정책에 따라 구매자가 취소수수료를 추가 부담하여야 합니다.'
                      '\n12. 발권요청 중 상태에서는 즉시 취소처리가 완료되는것이 원칙이나 이미 구매한 상품이 발권처리되었다면 발권취소수수료를 구매자가 부담하여야 합니다. 또한 취소수수료 부과상품의 경우 구매상품의 취소정책에 따라 구매자가 취소수수료를 추가 부담하여야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제24조 (금지행위)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 회사가 제공하는 결제대금 보호 서비스를 이용하지 않고 판매자와 구매자가 직접 거래하는 행위(직거래)는 거래의 안전을 위하여 금지되고, 직거래를 통하여 발생한 제반 문제에 대한 책임은 거래 당사자에게 있으며 회사는 이에 대해 어떠한 책임도 지지 않습니다.'
                      '\n2. 직거래를 하거나 이를 유도한 것으로 확인된 판매자는 서비스 이용이 정지되거나 이용계약이 해지될 수 있으며, 회원은 직거래를 하거나 유도한 판매자를 회사가 운영하는 안전거래센터에 신고할 수 있습니다.'
                      '\n3. 회사가 제공하는 서비스 이용방법을 따르지 않고 비정상적인 방법으로 서비스를 이용하거나 시스템에 접근하는 행위는 금지됩니다.'
                      '\n4. 시스템 부정행위가 확인되면 회사는 해당 회원에게 부가적으로 제공한 혜택의 일부 또는 전부를 회수하거나, 특정 서비스의 이용을 제한하고, 이용계약을 해지하는 등의 조치를 할 수 있습니다.'
                      '\n5. 타인의 명의, 카드정보, 계좌정보 등을 무단으로 사용하여 회사가 제공하는 구매서비스를 이용하는 행위는 금지됩니다.'
                      '\n6. 물품판매 또는 용역제공을 가장하여 자금을 융통하는 것과 같이 여신전문금융업법 등 법령에 따라 금지된 방법으로 비정상적인 결제를 하는 것은 금지되며, 해당 내용이 확인되었을 때 회사는 회원의 거래를 취소하거나 중지시키고 관련기관에 통보할 수 있습니다.'
                      '\n7. 실제 상품의 배송이 없거나 회사가 제공하는 쿠폰 등의 유효기간을 연장하기 위한 목적으로 구매와 취소를 반복하는 등 상품의 실질적인 구매의사가 없는 구매행위와 회사가 제공하는 할인율 등을 이용하여 비정상적인 거래를 하는 것은 금지되며, 해당 내용이 확인되면 회사는 해당 거래를 취소하고 서비스이용을 제한하거나 이용계약을 해지할 수 있습니다.'
                      '\n8. 제3자에게 재판매하기 위한 목적으로 회사가 제공하는 혜택이나 할인율 등을 부당하게 이용하는 행위(다른 오픈마켓이나 인터넷쇼핑몰 등에 임의로 최저가를 등록하는 등으로 “웹사이트” 및 "어플리케이션"의 할인쿠폰 발행을 유도한 후 해당 쿠폰을 적용하여 구매하는 행위 등), 회사에 손실을 발생시키는 행위는 금지되며, 재판매 목적의 거래행위가 확인된 경우 회사는 해당 회원에 대하여 서비스이용제한, 이용계약의 해지 등의 조치를 취할 수 있으며, 이러한 행위로 손해가 있을 경우 배상을 청구할 수 있습니다.'
                      '\n9. 판매자 본인의 상품 구매 또는 실제 상품의 이동 없이 판매점수 및 광고효과를 높이기 위한 구매 또는 부당한 할인 획득을 위해 제3자의 이메일(E-Mail)을 이용한 구매 행위는 금지되며, 해당 내용이 확인된 경우 거래를 취소하고 서비스의 이용을 제한하는 등의 조치를 하거나 서비스의 이용을 제한하는 등의 조치를 할 수 있습니다.'
                      '\n10. 회사는 회원의 부정 거래 행위(현금융통, 결제수단도용, 대량 허위거래 등)가 의심되면 일시적으로 서비스 이용을 정지하고 거래 사실 확인 및 소명을 위해 정지한 날로부터 15일 이내에 필요 최소한의 증빙자료(거래사실증명서, 물품 수급 및 발주, 배송증빙서류 등)를 요청 할 수 있습니다. 만약 특별한 사정없이 회사가 요청한 증빙자료를 정해진 기한 내에 제출하지 않거나 서류 미비 또는 소명이 되지 않을 경우 서비스 이용이 영구히 정지되거나 이용계약이 해지될 수 있습니다.'
                      '\n11. 회사는 실질적인 구매의사 없이 구매 후 취/반품을 반복하는 행위 등으로 판매자의 원활한 판매와 공정한 시장환경 조성을 방해하는 회원에 대하여 [1/2차 경고, 3차 일정기간 이용정지, 4차 영구 이용정지] 등의 제재 조치를 취할 수 있습니다.'
                      '\n12. 회사는 회원의 법령 위반, 본 약관 위반, 기타 금지행위 여부에 대한 모니터링을 실시하고 있으며, 회원은 회사의 모니터링 업무에 대하여 협조하여야 하며 회사가 요청하는 필요 최소한의 증빙자료를 제출할 의무가 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제25조 (안전거래센터)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 회사는 타인의 권리 침해, 법령의 위반 등 회원이 서비스를 이용할 때 발생할 수 있는 거래의 안전과 관련된 법적 문제를 조정하기 위하여 안전거래센터를 운영합니다.'
                      '\n2. 안전거래센터는 다음과 같은 역할을 합니다.'
                      '\n①매매부적합물의 판매에 대한 조치'
                      '\n②타인의 권리를 침해하는 행위에 대한 조치'
                      '\n③약관 위반 또는 법령을 위반하는 행위에 대한 조치'
                      '\n④기타 거래의 안전 및 사이트의 안전 확보등을 위한 조치'
                      '\n⑤회원 또는 거래의 안전 확인 및 안전이 확인될 때 까지 거래 보류하거나 거래 취소할 수 있으며, 서비스 이용을 제한하거나 이용계약의 해지 등의 조치'
                      '\n3. 안전거래센터의 조정에 회원은 신의성실의 원칙에 따라 성실히 응해야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제26조 (분쟁조정 센터)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. 회사는 회원 상호 간 또는 회원과 제3자 간의 분쟁을 조정하기 위하여 분쟁조정센터를 운영 합니다.'
                          '\n2. 분쟁조정센터를 통하여 분쟁을 조정할 때 회사는 제3자의 입장에서 공정하게 분쟁의 조정에 임해야 합니다.'
                          '\n3. 분쟁조정센터의 조정에 회원은 신의성실의 원칙에 따라 성실히 응해야 합니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      '제5장 기타사항',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: const Color(0xff271238),
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 10),
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '제27조 (회사의 면책)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면책됩니다.'
                      '\n2. "회사"는 "회원"의 귀책사유로 인한 서비스의 이용 장애에 대하여 책임을 지지 않습니다.'
                      '\n3. "회사"는 "회원"이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비 스를 통하여 얻은 자료로 인한 손해 등에 대하여도 책임을 지지 않습니다.'
                      '\n4. "회사"는 "회원"이 게재한 게시물(이용후기, 숙소평가 등 포함)의 정확성 등 내용에 대하여는 책임을 지지 않습 니다.'
                      '\n5. "회사"는 "회원" 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.'
                      '\n6. "회사"는 제3자가 서비스 내 화면 또는 링크된 웹사이트를 통하여 광고한 제품 또는 서비스의 내용과 품질에 대하여 감시할 의무가 없으며 그로 인한 어떠한 책임도 지지 아니합니다.'
                      '\n7. "회사"는 "회사" 및 "회사"의 임직원 그리고 "회사" 대리인의 고의 또는 중대한 과실이 없는 한 다음 각 호의 사항으로 부터 발생하는 손해에 대해 책임을 지지 아니합니다.'
                      '\n①회원정보 등의 허위 또는 부정확성에 기인하는 손해'
                      '\n②서비스에 대한 접속 및 서비스의 이용과정에서 발생하는 개인적인 손해'
                      '\n③서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해'
                      '\n④서버에 대한 전송 또는 서버로부터의 전송에 대한 제3자의 모든 불법적인 방해 또는 중단행위로부터 발생하는 손해'
                      '\n⑤제3자가 서비스를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해'
                      '\n⑥전송된 데이터의 오류 및 생략, 누락, 파괴 등으로 발생되는 손해'
                      '\n⑦"회원"간의 "회원" 상태 정보 등록 및 서비스 이용 과정에서 발생하는 명예훼손 기타 불법행위로 인한 각종 민∙형사상 책임'
                      '\n8. 재화의 특성이나 재화 제공업체의 환불규정이 당사의 취소 환불 규정에 우선한 결과 위 ‘소비자분쟁해결기준’ 과는 다르게 배상되는 경우, 당사는 이에 관하여 일체의 책임을 지지 않습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제28조(분쟁해결)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"는 "이용자"가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상 처리 기구를 설치, 운영합니다.'
                          '\n2. "회사"는 "이용자"로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리 가 곤란한 경우에는"이용자"에게 그 사유와 처리일정을 즉시 통보해 드립니다.'
                          '\n3. "회사"와 "이용자" 간에 발생한 전자상거래 분쟁과 관련하여 "이용자"의 피해구제신청이 있는 경우에는 공정거 래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제29조(재판권 및 준거법)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1. "회사"에서 정하는 규정에서 정하지 않은 사항과 본 규정의 해석은 관계법령 및 상관례에 따릅니다.'
                          '\n2.	"회사"에서 정하는 규정과 관련된 모든 분쟁은 제소 당시 "이용자"의 주소에 의하고, 주소가 없는 경우에는 거 소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 "이용자"의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. 동 소송에는 대한민국법을 적용하도록 합니다',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\n제30조(특별규정)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '당 약관에 명시되지 않은 사항은 전자거래기본법, 전자서명법, 전자상거래등에서의 소비자보호에 관한 법률 기타 관련법령의 규정 및 국내외 여행표준약관 등에 의합니다.\n',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ]
            )
        )
    );
  }
}

class personalinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://e9tour.com/privacy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class overseatrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://e9tour.com/travel',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class domestictravel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://e9tour.com/domestic',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}