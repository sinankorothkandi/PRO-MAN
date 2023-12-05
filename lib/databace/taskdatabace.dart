// ignore_for_file: prefer_initializing_formals

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'taskdatabace.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late int? taskId;

  @HiveField(1)
  late String heading;

  @HiveField(2)
  late String details;

  @HiveField(3)
  late List<Subtask> subtasks;

  @HiveField(4)
  String? endDates;

  @HiveField(5)
  String? startDates;

  @HiveField(6)
  late List<bool> completedSubtasks;

  @HiveField(7)
  late bool dailyTaskcompleate;

  TaskModel({
    required this.details,
    required this.heading,
    required this.startDates,
    required this.endDates,
    required this.subtasks,
    this.dailyTaskcompleate = false,
    int? taskId,
  })   : taskId = taskId,
        completedSubtasks = List.generate(subtasks.length, (index) => false);

  static int _lastTaskId = 0;

 factory TaskModel.createTask({
  required String heading,
  required String details,
  required String? endDates,
  required String? startDates,
  required List<Subtask> subtasks,
}) {
  _lastTaskId++;
  return TaskModel(
    taskId: _lastTaskId,
    heading: heading,
    details: details,
    subtasks: subtasks.map((subtask) => Subtask(
      description: subtask.description,
      isCompleted: subtask.isCompleted,
      taskId: _lastTaskId,
    )).toList(),
    startDates: startDates,
    endDates: endDates,
  );
}


  int getCompletedSubtaskCount() {
    return subtasks.where((subtask) => subtask.isCompleted).length;
  }

  int getPendingSubtaskCount() {
    return subtasks.where((subtask) => !subtask.isCompleted).length;
  }

  bool isCompleted() {
    return getCompletedSubtaskCount() == subtasks.length;
  }

  TaskModel copyWith({
    int? taskId,
    String? heading,
    String? details,
    String? endDates,
    String? startDates,
    List<Subtask>? subtasks,
  }) {
    return TaskModel(
      taskId: taskId ?? this.taskId,
      heading: heading ?? this.heading,
      details: details ?? this.details,
      endDates: endDates ?? this.endDates,
      startDates: startDates ?? this.startDates,
      subtasks: subtasks ?? this.subtasks,
    );
  }
}

@HiveType(typeId: 2)
class Subtask {
  @HiveField(0)
  late String description;

  @HiveField(1)
  late bool isCompleted;

  @HiveField(2)
  late int? taskId;

  Subtask({
    required this.description,
    this.isCompleted = false,
     this.taskId,
  });

  Future<void> save() async {
    final box = await Hive.openBox<Subtask>('subtasks');
    
    await box.put(taskId.hashCode, this);
    
    await box.close();
  }
}


