/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:46:34
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 11:10:45
 */
import 'package:house_work/Global/global_data.notifier.dart';
import 'package:house_work/models/index.dart';

class IncomeData extends GloabalDataNotifier {
  Income get incomeData {
    return userData.incomes;
  }

  set incomeData(Income income) {
    userData.incomes = income;
    notifyListeners();
  }

  get total {
    return userData.incomes.total ?? 0;
  }

  void updateIncome(Todo todo) {
    if (todo.task != null) {
      incomeData.total += todo.task!.worth;
    }
    notifyListeners();
  }
}
