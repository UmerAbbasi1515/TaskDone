
class SessionController {
  static final SessionController instance = SessionController._internal();

  SessionController._internal();
  
  int? test = 2;
  String token = "";

  int? getTest() {
    return test;
  }
  String? getToken() {
    return token;
  }
}
