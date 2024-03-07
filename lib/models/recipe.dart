import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  Recipe();

  String? id;
  late String name;
  String? description;
  String? banner;
  late String steps;
  late bool deleted;
  
  factory Recipe.fromJson(Map<String,dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
