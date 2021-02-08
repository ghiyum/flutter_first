
class SignInfo{
  static var name;
  static var gender;
  static var email;
  static var phone;
  static var dofor;
  static var birth;
  static var password;
  static var year;
  static var sns;

  static bool isLogin = false;

  static bool iscertify_mail = false;
  static bool iscertify_phone = false;
  static bool iscertify_name = false;

  static Clear(){
    name = '';
    gender = '';
    email = '';
    phone = '';
    dofor = '';
    birth = '';
    password = '';
    year = 0;
    sns = '';
  }
}

class JoinData {
  static bool emailcertify = false;
  static bool enabledfield_email = true;  // sns에서 넘어올 경우 받은 데이터로 fix
  static String email = '';

  static String sns = '';
  static bool phonecertify = false;
  static bool enabledfield_phone = true;
  static String phone = '';
}