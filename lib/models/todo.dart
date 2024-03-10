import 'package:json_annotation/json_annotation.dart';
import "houseWork.dart";
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo();

  late String id;
  late String name;
  String? description;
  String? taskId;
  HouseWork? task;
  String? startTime;
  String? endTime;
  String? finishTime;
  late bool finished;
  late bool deleted;
  
  factory Todo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
