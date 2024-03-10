/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:39:04
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-08 21:17:57
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_work/Global/global_data.dart';
import 'package:house_work/models/userData.dart';

class GloabalDataNotifier extends ChangeNotifier {
  UserData get userData {
    return GlobalData.userData;
  }

  @override
  void notifyListeners() {
    GlobalData.saveUserData();
    super.notifyListeners();
  }
}
