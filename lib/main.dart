import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/views/tasks_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DailyFocusApp());
}

class DailyFocusApp extends StatelessWidget {
  const DailyFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const TasksView(),
    );
  }
}
