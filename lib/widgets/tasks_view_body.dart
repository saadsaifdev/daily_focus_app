import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/model/task_model.dart';
import 'package:daily_focus_app/widgets/add_task_bottom_sheet.dart';
import 'package:daily_focus_app/widgets/bottom_action_row.dart';
import 'package:daily_focus_app/widgets/custom_app_bar.dart';
import 'package:daily_focus_app/widgets/edit_task_bottom_sheet.dart';
import 'package:daily_focus_app/widgets/focus_tasks_header.dart';
import 'package:daily_focus_app/widgets/progress_card.dart';
import 'package:daily_focus_app/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  List<TaskModel> myTasks = [];

  void _openAddTaskSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddTaskBottomSheet(),
    );

    if (result != null && result is TaskModel) {
      setState(() {
        myTasks.add(result);
      });
    }
  }

  void _openEditTaskSheet(TaskModel taskToEdit, int index) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditTaskBottomSheet(taskToEdit: taskToEdit),
    );

    if (result != null && result is TaskModel) {
      setState(() {
        myTasks[index] = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int total = myTasks.length;
    int completed = myTasks.where((task) => task.isCompleted == true).length;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const CustomAppBar(title: "Daily Focus", searchIcon: Icons.search),
            const SizedBox(height: 24),

            ProgressCard(totalTasks: total, completedTasks: completed),

            const SizedBox(height: 24),
            const FocusTasksHeader(),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: myTasks.length,
                itemBuilder: (context, index) {
                  final task = myTasks[index];

                  return TaskCard(
                    title: task.title,
                    time: task.time,
                    isCompleted: task.isCompleted,
                    priority: task.priority,
                    category: task.category,
                    onDelete: () {
                      setState(() {
                        myTasks.removeAt(index);
                      });
                    },
                    onToggle: () {
                      setState(() {
                        task.isCompleted = !task.isCompleted;
                      });
                    },
                    onCardTap: () => _openEditTaskSheet(task, index),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            BottomActionRow(onAddTap: _openAddTaskSheet),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
