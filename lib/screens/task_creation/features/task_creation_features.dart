import 'package:techarrow_mobile_final/enums/task_types.dart';

class TaskCreationFeatures {
  Future<void> createTask(
      {required String title,
      required String description,
      required TaskTypes type,
      required bool isImportant,
      Duration? duration,
      List<String>? subtasks}) async {
    print(
        "$title, $description, $type, $isImportant, $duration, $subtasks - created task");
  }
}
