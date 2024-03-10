import 'package:json_annotation/json_annotation.dart';
import "houseWork.dart";
import "income.dart";
import "todo.dart";
import "recipe.dart";
part 'userData.g.dart';

@JsonSerializable()
class UserData {
  UserData();

  late List<HouseWork> houseWorks;
  late Income incomes;
  late List<Todo> todos;
  late List<Recipe> recipes;
  
  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
