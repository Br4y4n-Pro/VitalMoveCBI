// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
