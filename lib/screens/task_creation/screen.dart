import 'package:flutter/material.dart';
import 'package:flutter_time_duration_picker/flutter_time_duration_picker.dart';
import 'package:techarrow_mobile_final/screens/task_creation/features/task_creation_features.dart';

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TimeColumnController _minutesController =
      TimeColumnController(minValue: 0, maxValue: 59);
  final TimeColumnController _hoursController =
      TimeColumnController(minValue: 0, maxValue: 23);

  final _features = TaskCreationFeatures();

  Duration _duration = const Duration();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Создание задачи"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Название',
                )),
          ),
          Row(
            children: [
              Expanded(
                child: TimeDurationPicker(
                  columns: [
                    TimeColumnConfig.minutes(
                        controller: _hoursController, maxValue: 23),
                    TimeColumnConfig.minutes(controller: _minutesController),
                  ],
                  onChanged: (value) {
                    print('Selected duration: $value');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _features.createTask(_nameController.text, _duration).then(
            (value) {
              if (context.mounted) Navigator.of(context).pop();
            },
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
