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

TaskGetRs _$TaskGetRsFromJson(Map<String, dynamic> json) => TaskGetRs(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: taskCategoryFromJson(json['category']),
      duration: json['duration'] as String,
      importance: json['importance'] as bool,
      isMulti: json['is_multi'] as bool,
      multiId: json['multi_id'],
      multiColor: json['multi_color'],
    );

Map<String, dynamic> _$TaskGetRsToJson(TaskGetRs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': taskCategoryToJson(instance.category),
      'duration': instance.duration,
      'importance': instance.importance,
      'is_multi': instance.isMulti,
      'multi_id': instance.multiId,
      'multi_color': instance.multiColor,
    };

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

TaskListDate _$TaskListDateFromJson(Map<String, dynamic> json) => TaskListDate(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TaskListDateToJson(TaskListDate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TaskListDateRs _$TaskListDateRsFromJson(Map<String, dynamic> json) =>
    TaskListDateRs(
      plannedTasks: (json['planned_tasks'] as List<dynamic>?)
              ?.map((e) => TaskListDate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      completedTasks: (json['completed_tasks'] as List<dynamic>?)
              ?.map((e) => TaskListDate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TaskListDateRsToJson(TaskListDateRs instance) =>
    <String, dynamic>{
      'planned_tasks': instance.plannedTasks.map((e) => e.toJson()).toList(),
      'completed_tasks':
          instance.completedTasks.map((e) => e.toJson()).toList(),
    };

TaskListRs _$TaskListRsFromJson(Map<String, dynamic> json) => TaskListRs(
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TaskListRsToJson(TaskListRs instance) =>
    <String, dynamic>{
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
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
