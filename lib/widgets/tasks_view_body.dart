import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            CustomAppBar(title: "Daily Focus", searchIcon: (Icons.search)),
          ],
        ),
      ),
    );
  }
}
