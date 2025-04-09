// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HTTPValidationError _$HTTPValidationErrorFromJson(Map<String, dynamic> json) =>
    HTTPValidationError(
      detail: (json['detail'] as List<dynamic>?)
              ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HTTPValidationErrorToJson(
        HTTPValidationError instance) =>
    <String, dynamic>{
      'detail': instance.detail?.map((e) => e.toJson()).toList(),
    };

HealthcheckPingRs _$HealthcheckPingRsFromJson(Map<String, dynamic> json) =>
    HealthcheckPingRs(
      status: json['status'] as String,
      responseTime: (json['response_time'] as num).toDouble(),
    );

Map<String, dynamic> _$HealthcheckPingRsToJson(HealthcheckPingRs instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response_time': instance.responseTime,
    };

SubTask _$SubTaskFromJson(Map<String, dynamic> json) => SubTask(
      name: json['name'] as String,
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$SubTaskToJson(SubTask instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
    };

TaskCreateRq _$TaskCreateRqFromJson(Map<String, dynamic> json) => TaskCreateRq(
      type: type$FromJson(json['type']),
      name: json['name'] as String,
      description: json['description'] as String,
      duration: json['duration'] as String?,
      importance: json['importance'] as bool,
      category: taskCategoryFromJson(json['category']),
      subtasks: (json['subtasks'] as List<dynamic>?)
              ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TaskCreateRqToJson(TaskCreateRq instance) =>
    <String, dynamic>{
      'type': type$ToJson(instance.type),
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'importance': instance.importance,
      'category': taskCategoryToJson(instance.category),
      'subtasks': instance.subtasks?.map((e) => e.toJson()).toList(),
    };

TaskCreateRs _$TaskCreateRsFromJson(Map<String, dynamic> json) => TaskCreateRs(
      taskId: json['task_id'] as String,
    );

Map<String, dynamic> _$TaskCreateRsToJson(TaskCreateRs instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
    };

TaskToPlanRq _$TaskToPlanRqFromJson(Map<String, dynamic> json) => TaskToPlanRq(
      date: DateTime.parse(json['date'] as String),
      tasks:
          (json['tasks'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$TaskToPlanRqToJson(TaskToPlanRq instance) =>
    <String, dynamic>{
      'date': _dateToJson(instance.date),
      'tasks': instance.tasks,
    };

TaskToPlanRs _$TaskToPlanRsFromJson(Map<String, dynamic> json) => TaskToPlanRs(
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskToPlanRsToJson(TaskToPlanRs instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) =>
    ValidationError(
      loc: (json['loc'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
          [],
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
