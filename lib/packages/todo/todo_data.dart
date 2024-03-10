/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:46:34
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 10:09:20
 */
import 'package:house_work/Global/global_data.notifier.dart';
import 'package:house_work/models/index.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TodoActions {
  static String add = 'add';
  static String delete = 'delete';
  static String update = 'update';
  static String finish = 'finish';
}

class TodoData extends GloabalDataNotifier {
  int length = 0;

  int finishedLength = 0;

  int total = 0;

  static Todo generateData(Todo? houseWork) {
    if (houseWork != null) {
      return houseWork;
    } else {
      return Todo()
        ..id = const Uuid().v8()
        ..finished = false
        ..deleted = false;
    }
  }

  List<Todo> get todos {
    return userData.todos.where((todo) {
      return !todo.deleted && !todo.finished;
    }).toList();
  }

  List<Todo> get finishedList {
    return userData.todos.where((todo) {
      return !todo.deleted && todo.finished;
    }).toList();
  }

  double get progress {
    return total == 0 ? .0 : finishedLength / total;
  }

  void updateLength(String action, [bool finished = false]) {
    if (action == TodoActions.add) {
      length++;
      total++;
    } else if (action == TodoActions.finish) {
      length--;
      finishedLength++;
    } else if (action == TodoActions.delete) {
      finished ? finishedLength-- : length--;
      total--;
    }
  }

  void add(Todo todo) {
    updateLength(TodoActions.add);
    userData.todos.add(todo);
    notifyListeners();
  }

  void delete(Todo todo) {
    final index = findIndex(todo);
    if (index != -1) {
      updateLength(TodoActions.delete, userData.todos[index].finished);
      userData.todos[index].deleted = true;
      notifyListeners();
    }
  }

  void update(Todo todo) {
    final index = findIndex(todo);
    if (index != -1) {
      userData.todos[index] = todo;
      notifyListeners();
    }
  }

  void finish(Todo todo) {
    final index = findIndex(todo);
    if (index != -1) {
      updateLength(TodoActions.finish);
      userData.todos[index]
        ..finished = true
        ..finishTime = DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now());
      notifyListeners();
    }
  }

  int findIndex(Todo todo) {
    return userData.todos.indexWhere((element) {
      return element.id == todo.id;
    });
  }
}
