import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  String userName = '', email = '', id = '', parentOrChildName = '', password = '', type = '', imageUrl = '', subject = '';
  int level = 0, age = 0;
  List<String> arabicGrades = [], englishGrades = [], mathGrades = [], scienceGrades = [];

  void setData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (key) {
      case 'userName':
        {
          userName = value;
          prefs.setString(key, userName);
          break;
        }
      case 'type':
        {
          type = value;
          prefs.setString(key, type);
          break;
        }
      case 'imageUrl':
        {
          imageUrl = value;
          prefs.setString(key, imageUrl);
          break;
        }
      case 'subject':
        {
          subject = value;
          prefs.setString(key, subject);
          break;
        }
      case 'age':
        {
          age = value;
          prefs.setInt(key, age);
          break;
        }
      case 'level':
        {
          level = value;
          prefs.setInt(key, level);
          break;
        }
      case 'password':
        {
          password = value;
          prefs.setString(key, password);
          break;
        }
      case 'parenOrChildName':
        {
          parentOrChildName = value;
          prefs.setString(key, parentOrChildName);
          break;
        }
      case 'id':
        {
          id = value;
          prefs.setString(key, id);
          break;
        }
      case 'arabicGrades':
        {
          arabicGrades = value;
          prefs.setStringList(key, arabicGrades);
          break;
        }
      case 'scienceGrades':
        {
          scienceGrades = value;
          prefs.setStringList(key, scienceGrades);
          break;
        }
      case 'mathGrades':
        {
          mathGrades = value;
          prefs.setStringList(key, mathGrades);
          break;
        }
      case 'englishGrades':
        {
          englishGrades = value;
          prefs.setStringList(key, englishGrades);
          break;
        }
      case 'email':
        {
          email = value;
          prefs.setString(key, email);
          break;
        }
    }
    notifyListeners();
  }
}