// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData()
  ..houseWorks = (json['houseWorks'] as List<dynamic>)
      .map((e) => HouseWork.fromJson(e as Map<String, dynamic>))
      .toList()
  ..incomes = Income.fromJson(json['incomes'] as Map<String, dynamic>)
  ..todos = (json['todos'] as List<dynamic>)
      .map((e) => Todo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..recipes = (json['recipes'] as List<dynamic>)
      .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'houseWorks': instance.houseWorks,
      'incomes': instance.incomes,
      'todos': instance.todos,
      'recipes': instance.recipes,
    };
