// import 'package:flutter/material.dart';
// import 'package:project_managment/databace/taskdatabace.dart';
// import 'package:project_managment/databace/history_model.dart';
// import 'package:project_managment/functions/background.dart';

// class Statistic extends StatefulWidget {
//   final TaskModel task;

//   const Statistic({Key? key, required this.task}) : super(key: key);

//   @override
//   State<Statistic> createState() => _StatisticState();
// }

// class _StatisticState extends State<Statistic> {
//   late List<TaskHistoryModel> taskHistory;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize your task history data here
//     taskHistory = getTaskHistory(widget.task.taskId!) ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: CustomAppBar(title: Text('Statistic')),
//       ),
//       body: CustomBackground(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Display filters for Recently, Last Week, This Month, and Last Month
//               buildFilters(),
//               // Display the task history based on the selected filter
//               buildTaskHistory(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildFilters() {
//     // Implement your filter buttons here
//     return Container(
//       // Your filter UI components go here
//     );
//   }

//   Widget buildTaskHistory() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: taskHistory.length,
//       itemBuilder: (context, index) {
//         return buildTaskTile(taskHistory[index]);
//       },
//     );
//   }

//   Widget buildTaskTile(TaskHistoryModel task) {
//     return ListTile(
//       title: Text(task.heading),
//       subtitle: Text('${task.startDate} - ${task.endDate}'),
//       trailing: buildStatusIndicator(task.isCompleted),
//       onTap: () {
//         // Implement onTap behavior if needed
//       },
//     );
//   }

//   Widget buildStatusIndicator(bool isCompleted) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: isCompleted ? Colors.green : Colors.red,
//           ),
//         ),
//         SizedBox(width: 8),
//         Text(isCompleted ? 'Completed' : 'Pending'),
//       ],
//     );
//   }
// }