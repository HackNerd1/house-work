/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:46:34
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 10:47:37
 */
import 'package:house_work/Global/global_data.notifier.dart';
import 'package:house_work/models/index.dart';
import 'package:uuid/uuid.dart';

class HouseWorkData extends GloabalDataNotifier {
  List<HouseWork> get houseWorks {
    return userData.houseWorks
        .where((houseWork) => houseWork.deleted == false)
        .toList();
  }

  set houseWorks(List<HouseWork> housework) {
    userData.houseWorks = housework;
    notifyListeners();
  }

  get length {
    return houseWorks.length ?? 0;
  }

  static String getPrice(HouseWork houseWork) {
    return "￥${houseWork.worth}";
  }

  static HouseWork generateData(HouseWork? houseWork) {
    if (houseWork != null) {
      return houseWork;
    } else {
      return HouseWork()
        ..id = const Uuid().v8()
        ..deleted = false;
    }
  }

  add(HouseWork houseWork) {
    userData.houseWorks.add(houseWork);
    notifyListeners();
  }

  update(HouseWork houseWork) {
    final index = findIndex(houseWork);
    if (index != -1) {
      userData.houseWorks[index] = houseWork;
      notifyListeners();
    }
  }

  delete(HouseWork houseWork) {
    final index = findIndex(houseWork);
    if (index != -1) {
      userData.houseWorks[index].deleted = true;
      notifyListeners();
    }
  }

  int findIndex(HouseWork houseWork) {
    return userData.houseWorks.indexWhere((element) {
      return element.id == houseWork.id;
    });
  }

  HouseWork find(String id) {
    return userData.houseWorks.firstWhere((element) {
      return element.id == id;
    });
  }
}
