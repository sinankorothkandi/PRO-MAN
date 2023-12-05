// Updated dailyPreview class
// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/HomePage/homePage.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/color.dart';


class dailyPreview extends StatefulWidget {
  final TaskModel selectedTask;
  dailyPreview({required this.selectedTask, Key? key}) : super(key: key);

  @override
  State<dailyPreview> createState() => _dailyPreviewState();
}

class _dailyPreviewState extends State<dailyPreview> {
  late TaskModel selectedTask;
  double progressValue = 0.7;

  @override
  void initState() {
    super.initState();
    selectedTask = widget.selectedTask;
  }

 String calculateHoursRemaining(DateTime? startDate, DateTime? endDate) {
  if (startDate == null || endDate == null) return 'N/A';

  final difference = endDate.difference(startDate);
  final hours = difference.inHours;

  return hours.toString();
}

String calculateMinutesRemaining(DateTime? startDate, DateTime? endDate) {
  if (startDate == null || endDate == null) return 'N/A';

  final difference = endDate.difference(startDate);
  final minutes = difference.inMinutes % 60;

  return minutes.toString();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 890,
          width: 380,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      selectedTask.heading,
                      style: const TextStyle(
                          fontSize: 26,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      height: 39,
                      width: 39,
                      decoration: const BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const HomePage()));
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'start',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'end',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${selectedTask.startDates != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(selectedTask.startDates!)) : 'N/A'} ",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${selectedTask.endDates != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(selectedTask.endDates!)) : 'N/A'} ",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 65,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Text(
  calculateHoursRemaining(
    selectedTask.startDates != null
        ? DateTime.parse(selectedTask.startDates!)
        : null,
    selectedTask.endDates != null
        ? DateTime.parse(selectedTask.endDates!)
        : null,
  ),
                            style: const TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'hours',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
  calculateHoursRemaining(
    selectedTask.startDates != null
        ? DateTime.parse(selectedTask.startDates!)
        : null,
    selectedTask.endDates != null
        ? DateTime.parse(selectedTask.endDates!)
        : null,
  ),
                            style: const TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'minutes',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 18),
                    )),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  selectedTask.details,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 29,
                ),
                SizedBox(
                  height: 60,
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () async {
                      selectedTask.dailyTaskcompleate = !selectedTask.dailyTaskcompleate;

                      for (var subtask in selectedTask.subtasks) {
                        subtask.isCompleted = selectedTask.dailyTaskcompleate;
                        await subtask.save();
                      }

                      await selectedTask.save();

                      Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Finish',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class subTskListView extends StatelessWidget {
//   List<TaskModel> tasks = [];

//   subTskListView({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: Hive.box<TaskModel>('tasks_db').listenable(),
//       builder: (context, Box<TaskModel> box, child) {
//         tasks = box.values.toList();
//         return SizedBox(
//           height: 300,
//           child: ListView.builder(
//             padding: const EdgeInsets.only(top: 10),
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               final task = tasks[index];

//               return GestureDetector(
//                 onTap: () async {
//                   task.dailyTaskcompleate = !task.dailyTaskcompleate;

//                   for (var subtask in task.subtasks) {
//                     subtask.isCompleted = task.dailyTaskcompleate;
//                     await subtask.save();
//                   }

//                   await task.save();
//                 },
//                 onLongPress: () {
//                   // deleteTask(task.key);
//                 },
//                 child: GestureDetector(
//                   onLongPress: () {
//                     // deleteTask(task.key);
//                   },
//                   child: ListTile(
//                     title: Text(
//                       task.subtasks
//                           .map((subtask) => subtask.description)
//                           .join(', '),
//                       style: TextStyle(
//                         color: task.dailyTaskcompleate == true
//                             ? blue
//                             : Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                     trailing: Icon(
//                       task.dailyTaskcompleate == true
//                           ? Icons.radio_button_checked_sharp
//                           : Icons.radio_button_off,
//                       color: blue,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
