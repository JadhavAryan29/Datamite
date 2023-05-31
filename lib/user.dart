import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name = "";
  String email = "aryanjadhav2910@gmail.com";
  String pwd = "123456";
  String? token;

  bool signIn(String emailTxt, String pwdTxt) {
    if (email == emailTxt && pwd == pwdTxt) {
      token = "Auth_token";
    } else {
      return false;
    }
    notifyListeners();
    return true;
  }

  bool signUp(String nametxt, String emailTxt, String pwdTxt) {
    name = nametxt;
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
    return true;
  }

  void logOut() {
    token = null;
    notifyListeners();
  }
}
