// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'houseWork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseWork _$HouseWorkFromJson(Map<String, dynamic> json) => HouseWork()
  ..id = json['id'] as String?
  ..name = json['name'] as String
  ..banner = json['banner'] as String?
  ..description = json['description'] as String?
  ..worth = json['worth'] as num
  ..deleted = json['deleted'] as bool;

Map<String, dynamic> _$HouseWorkToJson(HouseWork instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'banner': instance.banner,
      'description': instance.description,
      'worth': instance.worth,
      'deleted': instance.deleted,
    };
