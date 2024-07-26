import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class LocalStorageService extends GetxService {
  LocalStorageService._();
  static final box = Hive.box("venturo");

  static Future deleteAuth() async {
    if (box.get("isRememberMe") == false) {
      box.clear();
      box.put("isLogin", false);
    } else {
      box.put("isLogin", false);
    }
  }

  static Future signInAuth(String email, String password) async {
    box.put("isLogin", true);
    box.put("isLoginEmail", true);
    box.put("email", email);
    box.put("password", password);
  }

  static Future signInGmailAuth(UserCredential userCredential) async {
    box.put("isLogin", true);
    box.put("isLoginGmail", true);
    box.put("email", userCredential.user!.email);
    box.put("cred", userCredential.credential!.providerId);
  }

  static Future<bool> isLogin() async {
    return box.get("isLogin") ?? false;
  }
}
