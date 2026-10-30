import 'package:daily_focus_app/constants.dart';
import 'package:flutter/material.dart';

class FocusTasksHeader extends StatelessWidget {
  const FocusTasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Focus Tasks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: kSurfaceHighestColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "4 PENDING",
            style: TextStyle(
              color: kPrimaryContainer,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: const [
            Icon(Icons.swap_vert, color: kOnSurfaceVariant, size: 20),
            SizedBox(width: 4),
            Text(
              "Order",
              style: TextStyle(
                color: kOnSurfaceVariant,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}