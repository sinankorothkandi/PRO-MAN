import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_man/databace/taskdatabace.dart';


  void saveTaskDetails(TaskModel task) async {
    final taskBox = await Hive.openBox<TaskModel>('tasks_db');
    await taskBox.add(task);
  }


Future<List<TaskModel>> getAllTasksFromHive() async {
    await Hive.openBox<TaskModel>('tasks_db'); 
    final taskBox = Hive.box<TaskModel>('tasks_db');
    final tasks = taskBox.values.toList();
    return tasks;
}

Future<void> deleteTask(int taskId) async {
  final taskDB = await Hive.openBox<TaskModel>('tasks_db');
  await taskDB.delete(taskId);
  await getAllTasksFromHive();
}

Future<List<TaskModel>> editTask(int taskId, TaskModel updatedTask) async {
  final taskDB = await Hive.openBox<TaskModel>('tasks_db');
  await taskDB.put(taskId, updatedTask);
  return getAllTasksFromHive();
}
Future<int> getCompletedTaskCount() async {
  final taskDB = await Hive.openBox<TaskModel>('tasks_db');
  final tasks = taskDB.values.toList();
  return tasks.where((task) => task.isCompleted()).length;
}

Future<int> getPendingTaskCount() async {
  final taskDB = await Hive.openBox<TaskModel>('tasks_db');
  final tasks = taskDB.values.toList();
  return tasks.where((task) => !task.isCompleted()).length;
}


// Future<void> editTask(int taskId, TaskModel updatedTask) async {
//   final taskDB = await Hive.openBox<TaskModel>('tasks_db');
//   await taskDB.put(taskId, updatedTask);
//   getAllTasksFromHive();
// }




