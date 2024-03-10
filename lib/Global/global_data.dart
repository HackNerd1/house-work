/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:23:13
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 20:52:49
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:house_work/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalData {
  static UserData userData = UserData()
    ..houseWorks = []
    ..incomes = Income()
    ..todos = []
    ..recipes = [];

  static late SharedPreferences sharedPreferences;

  // 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();

    var houseWorksData = sharedPreferences.getString("houseWorks");
    var todoData = sharedPreferences.getString("todos");
    var recipeData = sharedPreferences.getString("recipes");
    var incomeData = sharedPreferences.getString("incomes");

    // print("============= init data ${todoData}");
    // sharedPreferences.clear();

    try {
      if (houseWorksData != null) {
        userData.houseWorks = (jsonDecode(houseWorksData) as List<dynamic>)
            .map((element) => HouseWork.fromJson(element))
            .toList();
      }
      if (todoData != null) {
        userData.todos = (jsonDecode(todoData) as List<dynamic>)
            .map((element) => Todo.fromJson(element))
            .toList();
      }
      if (incomeData != null) {
        userData.incomes = Income.fromJson(jsonDecode(incomeData));
      }
      if (recipeData != null) {
        userData.recipes = (jsonDecode(recipeData) as List<dynamic>)
            .map((element) => Recipe.fromJson(element))
            .toList();
      }
    } catch (e) {
      print(e);
    }
  }

  // 保存数据
  static saveUserData() {
    sharedPreferences.setString("houseWorks", jsonEncode(userData.houseWorks));
    sharedPreferences.setString("todos", jsonEncode(userData.todos));
    sharedPreferences.setString("recipes", jsonEncode(userData.recipes));
    print("=========== recipes ${jsonEncode(userData.recipes)}");
    print("=========== incomes ${jsonEncode(userData.incomes)}");
    sharedPreferences.setString(
        "incomes", jsonEncode(userData.incomes.toJson()));
  }
}
