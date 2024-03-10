// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..description = json['description'] as String?
  ..banner = json['banner'] as String?
  ..steps = json['steps'] as String
  ..deleted = json['deleted'] as bool;

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'banner': instance.banner,
      'steps': instance.steps,
      'deleted': instance.deleted,
    };
