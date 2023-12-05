import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pro_man/SplashScreen.dart';
import 'package:pro_man/databace/database.dart';
import 'package:pro_man/databace/taskdatabace.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
   Hive.registerAdapter(SubtaskAdapter());
  await Hive.initFlutter();     

  await Hive.openBox<UserModel>('user');
  await Hive.openBox<TaskModel>('tasks_db');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
