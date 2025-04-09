class Task {
  int id = 0;
  String title = '';
  String description = '';
  int startTime = 0;
  int endTime = 0;
  int colorId = 0; // 0 - red, 1 - blue, 2 - green
  int len = 0;
  TaskStatus status = TaskStatus.unscheduled;

  Task(this.id, this.title, this.description, this.startTime, this.endTime,
      this.colorId, this.len,
      {this.status = TaskStatus.unscheduled});
}

enum TaskStatus { unscheduled, scheduled, done }
