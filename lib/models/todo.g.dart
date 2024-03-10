// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..description = json['description'] as String?
  ..taskId = json['taskId'] as String?
  ..task = json['task'] == null
      ? null
      : HouseWork.fromJson(json['task'] as Map<String, dynamic>)
  ..startTime = json['startTime'] as String?
  ..endTime = json['endTime'] as String?
  ..finishTime = json['finishTime'] as String?
  ..finished = json['finished'] as bool
  ..deleted = json['deleted'] as bool;

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskId': instance.taskId,
      'task': instance.task,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'finishTime': instance.finishTime,
      'finished': instance.finished,
      'deleted': instance.deleted,
    };
