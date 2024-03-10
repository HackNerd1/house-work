/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:23:13
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 09:54:18
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:house_work/models/income.dart';
import 'package:house_work/models/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalData {
  static UserData userData = UserData();

  static late SharedPreferences sharedPreferences;

  // 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();

    var data = sharedPreferences.getString("userData");
    sharedPreferences.remove("userData");
    if (data != null) {
      try {
        userData = UserData.fromJson(jsonDecode(data));
      } catch (e) {
        print(e);
      }
    } else {
      userData = UserData()
        ..houseWorks = []
        ..incomes = Income()
        ..todos = []
        ..finishedTodos = []
        ..recipes = [];
    }
  }

  // 保存数据
  static saveUserData() {
    // sharedPreferences.setString("userData", jsonEncode(userData.toString()));
  }
}
