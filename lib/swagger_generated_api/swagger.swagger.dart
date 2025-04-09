// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'swagger.enums.swagger.dart' as enums;
export 'swagger.enums.swagger.dart';

part 'swagger.swagger.chopper.dart';
part 'swagger.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Swagger extends ChopperService {
  static Swagger create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Swagger(client);
    }

    final newClient = ChopperClient(
        services: [_$Swagger()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Swagger(newClient);
  }

  ///Ping
  Future<chopper.Response<HealthcheckPingRs>> apiPingGet() {
    generatedMapping.putIfAbsent(
        HealthcheckPingRs, () => HealthcheckPingRs.fromJsonFactory);

    return _apiPingGet();
  }

  ///Ping
  @Get(path: '/api/ping')
  Future<chopper.Response<HealthcheckPingRs>> _apiPingGet();

  ///Create Task
  Future<chopper.Response<TaskCreateRs>> apiTasksCreatePost(
      {required TaskCreateRq? body}) {
    generatedMapping.putIfAbsent(
        TaskCreateRs, () => TaskCreateRs.fromJsonFactory);

    return _apiTasksCreatePost(body: body);
  }

  ///Create Task
  @Post(
    path: '/api/tasks/create',
    optionalBody: true,
  )
  Future<chopper.Response<TaskCreateRs>> _apiTasksCreatePost(
      {@Body() required TaskCreateRq? body});

  ///To Planned
  Future<chopper.Response<TaskToPlanRs>> apiTasksToPlannedPut(
      {required TaskToPlanRq? body}) {
    generatedMapping.putIfAbsent(
        TaskToPlanRs, () => TaskToPlanRs.fromJsonFactory);

    return _apiTasksToPlannedPut(body: body);
  }

  ///To Planned
  @Put(
    path: '/api/tasks/to_planned',
    optionalBody: true,
  )
  Future<chopper.Response<TaskToPlanRs>> _apiTasksToPlannedPut(
      {@Body() required TaskToPlanRq? body});
}

@JsonSerializable(explicitToJson: true)
class HTTPValidationError {
  const HTTPValidationError({
    this.detail,
  });

  factory HTTPValidationError.fromJson(Map<String, dynamic> json) =>
      _$HTTPValidationErrorFromJson(json);

  static const toJsonFactory = _$HTTPValidationErrorToJson;
  Map<String, dynamic> toJson() => _$HTTPValidationErrorToJson(this);

  @JsonKey(name: 'detail', defaultValue: <ValidationError>[])
  final List<ValidationError>? detail;
  static const fromJsonFactory = _$HTTPValidationErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HTTPValidationError &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(detail) ^ runtimeType.hashCode;
}

extension $HTTPValidationErrorExtension on HTTPValidationError {
  HTTPValidationError copyWith({List<ValidationError>? detail}) {
    return HTTPValidationError(detail: detail ?? this.detail);
  }

  HTTPValidationError copyWithWrapped(
      {Wrapped<List<ValidationError>?>? detail}) {
    return HTTPValidationError(
        detail: (detail != null ? detail.value : this.detail));
  }
}

@JsonSerializable(explicitToJson: true)
class HealthcheckPingRs {
  const HealthcheckPingRs({
    required this.status,
    required this.responseTime,
  });

  factory HealthcheckPingRs.fromJson(Map<String, dynamic> json) =>
      _$HealthcheckPingRsFromJson(json);

  static const toJsonFactory = _$HealthcheckPingRsToJson;
  Map<String, dynamic> toJson() => _$HealthcheckPingRsToJson(this);

  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'response_time')
  final double responseTime;
  static const fromJsonFactory = _$HealthcheckPingRsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HealthcheckPingRs &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.responseTime, responseTime) ||
                const DeepCollectionEquality()
                    .equals(other.responseTime, responseTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(responseTime) ^
      runtimeType.hashCode;
}

extension $HealthcheckPingRsExtension on HealthcheckPingRs {
  HealthcheckPingRs copyWith({String? status, double? responseTime}) {
    return HealthcheckPingRs(
        status: status ?? this.status,
        responseTime: responseTime ?? this.responseTime);
  }

  HealthcheckPingRs copyWithWrapped(
      {Wrapped<String>? status, Wrapped<double>? responseTime}) {
    return HealthcheckPingRs(
        status: (status != null ? status.value : this.status),
        responseTime:
            (responseTime != null ? responseTime.value : this.responseTime));
  }
}

@JsonSerializable(explicitToJson: true)
class SubTask {
  const SubTask({
    required this.name,
    required this.duration,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);

  static const toJsonFactory = _$SubTaskToJson;
  Map<String, dynamic> toJson() => _$SubTaskToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'duration')
  final String duration;
  static const fromJsonFactory = _$SubTaskFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubTask &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      runtimeType.hashCode;
}

extension $SubTaskExtension on SubTask {
  SubTask copyWith({String? name, String? duration}) {
    return SubTask(
        name: name ?? this.name, duration: duration ?? this.duration);
  }

  SubTask copyWithWrapped({Wrapped<String>? name, Wrapped<String>? duration}) {
    return SubTask(
        name: (name != null ? name.value : this.name),
        duration: (duration != null ? duration.value : this.duration));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskCreateRq {
  const TaskCreateRq({
    required this.type,
    required this.name,
    required this.description,
    this.duration,
    required this.importance,
    required this.category,
    this.subtasks,
  });

  factory TaskCreateRq.fromJson(Map<String, dynamic> json) =>
      _$TaskCreateRqFromJson(json);

  static const toJsonFactory = _$TaskCreateRqToJson;
  Map<String, dynamic> toJson() => _$TaskCreateRqToJson(this);

  @JsonKey(
    name: 'type',
    toJson: type$ToJson,
    fromJson: type$FromJson,
  )
  final enums.Type$ type;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'duration')
  final String? duration;
  @JsonKey(name: 'importance')
  final bool importance;
  @JsonKey(
    name: 'category',
    toJson: taskCategoryToJson,
    fromJson: taskCategoryFromJson,
  )
  final enums.TaskCategory category;
  @JsonKey(name: 'subtasks', defaultValue: <SubTask>[])
  final List<SubTask>? subtasks;
  static const fromJsonFactory = _$TaskCreateRqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskCreateRq &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.importance, importance) ||
                const DeepCollectionEquality()
                    .equals(other.importance, importance)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.subtasks, subtasks) ||
                const DeepCollectionEquality()
                    .equals(other.subtasks, subtasks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(importance) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(subtasks) ^
      runtimeType.hashCode;
}

extension $TaskCreateRqExtension on TaskCreateRq {
  TaskCreateRq copyWith(
      {enums.Type$? type,
      String? name,
      String? description,
      String? duration,
      bool? importance,
      enums.TaskCategory? category,
      List<SubTask>? subtasks}) {
    return TaskCreateRq(
        type: type ?? this.type,
        name: name ?? this.name,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        importance: importance ?? this.importance,
        category: category ?? this.category,
        subtasks: subtasks ?? this.subtasks);
  }

  TaskCreateRq copyWithWrapped(
      {Wrapped<enums.Type$>? type,
      Wrapped<String>? name,
      Wrapped<String>? description,
      Wrapped<String?>? duration,
      Wrapped<bool>? importance,
      Wrapped<enums.TaskCategory>? category,
      Wrapped<List<SubTask>?>? subtasks}) {
    return TaskCreateRq(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        duration: (duration != null ? duration.value : this.duration),
        importance: (importance != null ? importance.value : this.importance),
        category: (category != null ? category.value : this.category),
        subtasks: (subtasks != null ? subtasks.value : this.subtasks));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskCreateRs {
  const TaskCreateRs({
    required this.taskId,
  });

  factory TaskCreateRs.fromJson(Map<String, dynamic> json) =>
      _$TaskCreateRsFromJson(json);

  static const toJsonFactory = _$TaskCreateRsToJson;
  Map<String, dynamic> toJson() => _$TaskCreateRsToJson(this);

  @JsonKey(name: 'task_id')
  final String taskId;
  static const fromJsonFactory = _$TaskCreateRsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskCreateRs &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taskId) ^ runtimeType.hashCode;
}

extension $TaskCreateRsExtension on TaskCreateRs {
  TaskCreateRs copyWith({String? taskId}) {
    return TaskCreateRs(taskId: taskId ?? this.taskId);
  }

  TaskCreateRs copyWithWrapped({Wrapped<String>? taskId}) {
    return TaskCreateRs(taskId: (taskId != null ? taskId.value : this.taskId));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskToPlanRq {
  const TaskToPlanRq({
    required this.date,
    required this.tasks,
  });

  factory TaskToPlanRq.fromJson(Map<String, dynamic> json) =>
      _$TaskToPlanRqFromJson(json);

  static const toJsonFactory = _$TaskToPlanRqToJson;
  Map<String, dynamic> toJson() => _$TaskToPlanRqToJson(this);

  @JsonKey(name: 'date', toJson: _dateToJson)
  final DateTime date;
  @JsonKey(name: 'tasks', defaultValue: <String>[])
  final List<String> tasks;
  static const fromJsonFactory = _$TaskToPlanRqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskToPlanRq &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(tasks) ^
      runtimeType.hashCode;
}

extension $TaskToPlanRqExtension on TaskToPlanRq {
  TaskToPlanRq copyWith({DateTime? date, List<String>? tasks}) {
    return TaskToPlanRq(date: date ?? this.date, tasks: tasks ?? this.tasks);
  }

  TaskToPlanRq copyWithWrapped(
      {Wrapped<DateTime>? date, Wrapped<List<String>>? tasks}) {
    return TaskToPlanRq(
        date: (date != null ? date.value : this.date),
        tasks: (tasks != null ? tasks.value : this.tasks));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskToPlanRs {
  const TaskToPlanRs({
    required this.status,
  });

  factory TaskToPlanRs.fromJson(Map<String, dynamic> json) =>
      _$TaskToPlanRsFromJson(json);

  static const toJsonFactory = _$TaskToPlanRsToJson;
  Map<String, dynamic> toJson() => _$TaskToPlanRsToJson(this);

  @JsonKey(name: 'status')
  final String status;
  static const fromJsonFactory = _$TaskToPlanRsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskToPlanRs &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^ runtimeType.hashCode;
}

extension $TaskToPlanRsExtension on TaskToPlanRs {
  TaskToPlanRs copyWith({String? status}) {
    return TaskToPlanRs(status: status ?? this.status);
  }

  TaskToPlanRs copyWithWrapped({Wrapped<String>? status}) {
    return TaskToPlanRs(status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class ValidationError {
  const ValidationError({
    required this.loc,
    required this.msg,
    required this.type,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  static const toJsonFactory = _$ValidationErrorToJson;
  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);

  @JsonKey(name: 'loc', defaultValue: <Object>[])
  final List<Object> loc;
  @JsonKey(name: 'msg')
  final String msg;
  @JsonKey(name: 'type')
  final String type;
  static const fromJsonFactory = _$ValidationErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ValidationError &&
            (identical(other.loc, loc) ||
                const DeepCollectionEquality().equals(other.loc, loc)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(loc) ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ValidationErrorExtension on ValidationError {
  ValidationError copyWith({List<Object>? loc, String? msg, String? type}) {
    return ValidationError(
        loc: loc ?? this.loc, msg: msg ?? this.msg, type: type ?? this.type);
  }

  ValidationError copyWithWrapped(
      {Wrapped<List<Object>>? loc,
      Wrapped<String>? msg,
      Wrapped<String>? type}) {
    return ValidationError(
        loc: (loc != null ? loc.value : this.loc),
        msg: (msg != null ? msg.value : this.msg),
        type: (type != null ? type.value : this.type));
  }
}

String? taskCategoryNullableToJson(enums.TaskCategory? taskCategory) {
  return taskCategory?.value;
}

String? taskCategoryToJson(enums.TaskCategory taskCategory) {
  return taskCategory.value;
}

enums.TaskCategory taskCategoryFromJson(
  Object? taskCategory, [
  enums.TaskCategory? defaultValue,
]) {
  return enums.TaskCategory.values
          .firstWhereOrNull((e) => e.value == taskCategory) ??
      defaultValue ??
      enums.TaskCategory.swaggerGeneratedUnknown;
}

enums.TaskCategory? taskCategoryNullableFromJson(
  Object? taskCategory, [
  enums.TaskCategory? defaultValue,
]) {
  if (taskCategory == null) {
    return null;
  }
  return enums.TaskCategory.values
          .firstWhereOrNull((e) => e.value == taskCategory) ??
      defaultValue;
}

String taskCategoryExplodedListToJson(List<enums.TaskCategory>? taskCategory) {
  return taskCategory?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskCategoryListToJson(List<enums.TaskCategory>? taskCategory) {
  if (taskCategory == null) {
    return [];
  }

  return taskCategory.map((e) => e.value!).toList();
}

List<enums.TaskCategory> taskCategoryListFromJson(
  List? taskCategory, [
  List<enums.TaskCategory>? defaultValue,
]) {
  if (taskCategory == null) {
    return defaultValue ?? [];
  }

  return taskCategory.map((e) => taskCategoryFromJson(e.toString())).toList();
}

List<enums.TaskCategory>? taskCategoryNullableListFromJson(
  List? taskCategory, [
  List<enums.TaskCategory>? defaultValue,
]) {
  if (taskCategory == null) {
    return defaultValue;
  }

  return taskCategory.map((e) => taskCategoryFromJson(e.toString())).toList();
}

String? type$NullableToJson(enums.Type$? type$) {
  return type$?.value;
}

String? type$ToJson(enums.Type$ type$) {
  return type$.value;
}

enums.Type$ type$FromJson(
  Object? type$, [
  enums.Type$? defaultValue,
]) {
  return enums.Type$.values.firstWhereOrNull((e) => e.value == type$) ??
      defaultValue ??
      enums.Type$.swaggerGeneratedUnknown;
}

enums.Type$? type$NullableFromJson(
  Object? type$, [
  enums.Type$? defaultValue,
]) {
  if (type$ == null) {
    return null;
  }
  return enums.Type$.values.firstWhereOrNull((e) => e.value == type$) ??
      defaultValue;
}

String type$ExplodedListToJson(List<enums.Type$>? type$) {
  return type$?.map((e) => e.value!).join(',') ?? '';
}

List<String> type$ListToJson(List<enums.Type$>? type$) {
  if (type$ == null) {
    return [];
  }

  return type$.map((e) => e.value!).toList();
}

List<enums.Type$> type$ListFromJson(
  List? type$, [
  List<enums.Type$>? defaultValue,
]) {
  if (type$ == null) {
    return defaultValue ?? [];
  }

  return type$.map((e) => type$FromJson(e.toString())).toList();
}

List<enums.Type$>? type$NullableListFromJson(
  List? type$, [
  List<enums.Type$>? defaultValue,
]) {
  if (type$ == null) {
    return defaultValue;
  }

  return type$.map((e) => type$FromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
