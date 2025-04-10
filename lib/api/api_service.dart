import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/enums/task_types.dart';
import 'package:techarrow_mobile_final/screens/task_creation/features/task_creation_features.dart';
import 'package:techarrow_mobile_final/swagger_generated_api/client_index.dart';
import 'package:techarrow_mobile_final/swagger_generated_api/swagger.swagger.dart';

class ApiService {
  static final api = Swagger.create(
      baseUrl: Uri.parse('http://192.168.168.29:5252'),
      interceptors: [AuthInterceptor()]);

  static Future<void> postTask(
      {required String title,
      required String description,
      required TaskTypes type,
      required bool isImportant,
      Duration? duration,
      List<Subtask>? subtasks}) async {
    var mtype = subtasks == null ? Type$.unplanned : Type$.multifaceted;
    var mduration = "${duration!.inHours}:${duration.inMinutes.remainder(60)}";
    var category = taskTypeToTaskCategory(type);
    var msubtasks = subtasks
        ?.map((e) => SubTask(
            name: e.title,
            duration:
                "${e.duration.inHours}:${e.duration.inMinutes.remainder(60)}"))
        .toList();
    var body = TaskCreateRq(
        type: mtype,
        name: title,
        description: description,
        duration: mduration,
        importance: isImportant,
        category: category,
        subtasks: msubtasks);

    print(body);

    var res = await ApiService.api.apiTasksCreatePost(body: body);
    print(res);
    print(res.statusCode);
  }
}

class AuthInterceptor implements HeadersInterceptor {
  AuthInterceptor();

  @override
  Map<String, String> get headers => {'Authorization': "Bearer token"};

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    if (await Keycloak().isTokenExpired()) {
      await Keycloak().refreshToken();
    }
    chain.request.headers['Authorization'] =
        'Bearer ${await FlutterSecureStorage().read(key: "access_token")}';
    return chain.proceed(chain.request);
  }
}
