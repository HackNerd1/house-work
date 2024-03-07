import 'package:json_annotation/json_annotation.dart';
import "houseWork.dart";
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo();

  String? id;
  late String name;
  late HouseWork task;
  late String startTime;
  late String endTime;
  late bool finished;
  late bool deleted;
  
  factory Todo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
