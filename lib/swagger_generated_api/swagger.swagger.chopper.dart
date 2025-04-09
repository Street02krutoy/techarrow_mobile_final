// dart format width=80
//Generated code

part of 'swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Swagger extends Swagger {
  _$Swagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Swagger;

  @override
  Future<Response<HealthcheckPingRs>> _apiPingGet() {
    final Uri $url = Uri.parse('/api/ping');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<HealthcheckPingRs, HealthcheckPingRs>($request);
  }

  @override
  Future<Response<TaskCreateRs>> _apiTasksCreatePost(
      {required TaskCreateRq? body}) {
    final Uri $url = Uri.parse('/api/tasks/create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TaskCreateRs, TaskCreateRs>($request);
  }

  @override
  Future<Response<TaskToPlanRs>> _apiTasksToPlannedPut(
      {required TaskToPlanRq? body}) {
    final Uri $url = Uri.parse('/api/tasks/to_planned');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TaskToPlanRs, TaskToPlanRs>($request);
  }
}
