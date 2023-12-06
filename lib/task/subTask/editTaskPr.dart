// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/task/taskpage.dart';

class EditPagePriority extends StatefulWidget {
  final TaskModel task;

  const EditPagePriority({Key? key, required this.task}) : super(key: key);

  @override
  State<EditPagePriority> createState() => _EditPagePriorityState();
}

class _EditPagePriorityState extends State<EditPagePriority> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late List<TextEditingController> subtaskControllers;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.heading);
    descriptionController = TextEditingController(text: widget.task.details);

    // Initialize subtaskControllers with existing subtask descriptions
    subtaskControllers = widget.task.subtasks
        .map((subtask) => TextEditingController(text: subtask.description))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Edit Task',style: TextStyle(color: Colors.white))),
      ),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: Text(
                  widget.task.heading,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: blue,
                  ),
                ),
              ),
              buildDateSelect(
                startDate: widget.task.startDates ?? '',
                endDate: widget.task.endDates ?? '',
              ),
              buildTextField('Title', titleController),
              buildCategoryButton(),
              buildTextField('Description', descriptionController, maxLines: 4),
              buildTextField('To Do List', subtaskControllers, isSubtask: true),
              buildEditButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateSelect({required String startDate, required String endDate}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDateContainer('Start Date', startDate),
          const SizedBox(width: 16),
          buildDateContainer('End Date', endDate),
        ],
      ),
    );
  }

  Widget buildDateContainer(String label, String date) {
    final formattedDate = date.isNotEmpty
        ? DateFormat('MMM dd, yyyy').format(DateTime.parse(date))
        : 'Not set';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, dynamic controllers,
      {int maxLines = 1, bool isSubtask = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 36, right: 250, bottom: 5, left: 34),
          child: Text(
            '$label ',
            style: const TextStyle(
                fontSize: 18, color: blue, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            children: [
              if (controllers is List<TextEditingController>)
                for (int i = 0; i < controllers.length; i++)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controllers[i],
                          decoration: InputDecoration(
                            hintText: isSubtask
                                ? 'Subtask ${i + 1}...'
                                : 'Task $label...',
                            border: InputBorder.none,
                          ),
                          maxLines: maxLines,
                        ),
                      ),
                      if (isSubtask)
                        Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  controllers.removeAt(i);
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.white,
                              )),
                        )
                      // IconButton(
                      //   icon: Icon(Icons.remove),
                      //   onPressed: () {
                      //     setState(() {
                      //       controllers.removeAt(i);
                      //     });
                      //   },
                      // ),
                    ],
                  ),
              if (controllers is TextEditingController)
                TextField(
                  controller: controllers,
                  decoration: InputDecoration(
                    hintText: isSubtask ? 'Subtask...' : 'Task $label...',
                    border: InputBorder.none,
                  ),
                  maxLines: maxLines,
                ),
              if (isSubtask)
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (controllers is List<TextEditingController>) {
                            controllers.add(TextEditingController());
                          }
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              // IconButton(
              //   icon: Icon(Icons.add),
              //   onPressed: () {
              //     setState(() {
              //       if (controllers is List<TextEditingController>) {
              //         controllers.add(TextEditingController());
              //       }
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCategoryButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, right: 230, left: 10),
          child: Text(
            'Category ',
            style: TextStyle(
                fontSize: 18, color: blue, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20),
          child: SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Priority',style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEditButton() {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        onPressed: () {
          List<Subtask> subtasks = subtaskControllers
              .map((controller) => Subtask(description: controller.text))
              .toList();

          final editedTask = widget.task.copyWith(
            heading: titleController.text,
            details: descriptionController.text,
            subtasks: subtasks,
          );

          editTask(widget.task.taskId!, editedTask);

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TaskPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text('Edit Task',style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
