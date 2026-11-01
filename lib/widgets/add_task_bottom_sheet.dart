import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/widgets/custom_text_field.dart';
import 'package:daily_focus_app/widgets/priority_card.dart';
import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  String selectedPriority = 'MEDIUM';

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: kPrimaryContainer,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "New Focus Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: kOnSurfaceVariant,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: titleController,
              hintText: "Task Title",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: subtitleController,
              hintText: "Task Subtitle / Details",
              maxLines: 3,
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Text(
                  "PRIORITY",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const Spacer(),
                Text(
                  "Required",
                  style: TextStyle(
                    color: kPrimaryContainer,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                PriorityCard(
                  label: "HIGH",
                  dotColor: const Color(0xFFFFB4AB),
                  selectedColor: const Color(0xFF93000A),
                  isSelected: selectedPriority == 'HIGH',
                  onTap: () {
                    setState(() {
                      selectedPriority = 'HIGH';
                    });
                  },
                ),
                const SizedBox(width: 8),
                PriorityCard(
                  label: "MEDIUM",
                  dotColor: const Color(0xFF4EDEA3),
                  selectedColor: const Color(0xFF00A572),
                  isSelected: selectedPriority == 'MEDIUM',
                  onTap: () {
                    setState(() {
                      selectedPriority = 'MEDIUM';
                    });
                  },
                ),
                const SizedBox(width: 8),
                PriorityCard(
                  label: "LOW",
                  dotColor: Colors.grey,
                  selectedColor: Colors.white.withValues(alpha: 0.15),
                  isSelected: selectedPriority == 'LOW',
                  onTap: () {
                    setState(() {
                      selectedPriority = 'LOW';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
