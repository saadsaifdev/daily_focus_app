import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/widgets/bottom_action_row.dart';
import 'package:daily_focus_app/widgets/custom_app_bar.dart';
import 'package:daily_focus_app/widgets/focus_tasks_header.dart';
import 'package:daily_focus_app/widgets/progress_card.dart';
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
            SizedBox(height: 24),
            ProgressCard(),
            SizedBox(height: 24),
            FocusTasksHeader(),
            Spacer(),
            const BottomActionRow(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
