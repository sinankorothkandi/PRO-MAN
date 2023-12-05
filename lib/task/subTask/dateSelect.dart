// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/functions/color.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key, required String startDate, required String endDate});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
static Future<DateTime?> showCalendarDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    return pickedDate;
  }

  DateTime? startDate;
  DateTime? endDate;


  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 25,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: const Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 18,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final pickedDate =
                                    await showCalendarDialog(context);
                                if (pickedDate != null) {
                                  setState(() {
                                    endDate = pickedDate;
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                color: blue,
                              ),
                            ),
                            endDate != null?
                              Text(
                                DateFormat('yyyy-MM-dd').format(endDate!),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ): Text(
                                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //===================================
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 70,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: const Text(
                            'End',
                            style: TextStyle(
                              fontSize: 18,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final pickedDate =
                                    await showCalendarDialog(context);
                                if (pickedDate != null) {
                                  setState(() {
                                    endDate = pickedDate;
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                color: blue,
                              ),
                            ),
                            endDate != null?
                              Text(
                                DateFormat('yyyy-MM-dd').format(endDate!),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ): Text(
                                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
  }
}