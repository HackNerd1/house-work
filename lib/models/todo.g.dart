// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo()
  ..id = json['id'] as String?
  ..name = json['name'] as String
  ..task = HouseWork.fromJson(json['task'] as Map<String, dynamic>)
  ..startTime = json['startTime'] as String
  ..endTime = json['endTime'] as String
  ..finished = json['finished'] as bool
  ..deleted = json['deleted'] as bool;

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'task': instance.task,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'finished': instance.finished,
      'deleted': instance.deleted,
    };
