//  import 'package:flutter/material.dart';
// import 'package:project_managment/functions/color.dart';

// void _openPopup() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: SizedBox(
//             height: 250,
//             width: 280,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: subtasksController,
//                   decoration: InputDecoration(
//                     labelText: 'Add Sub Task...',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Subtask';
//                     }
//                   },
//                 ),
//                 SizedBox(height: 25),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 278,
//                       height: 60,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             _addSubtask(subtasksController.text);
//                             subtasksController.clear();
//                             Navigator.of(context).pop();
//                             isSubTaskAdd = true;
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16.0),
//                           ),
//                         ),
//                         child: Text('Add Task'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       width: 278,
//                       height: 60,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16.0),
//                           ),
//                         ),
//                         child: Text('Cancel'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }