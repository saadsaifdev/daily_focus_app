import 'package:daily_focus_app/constants.dart';
import 'package:flutter/material.dart';

class BottomActionRow extends StatelessWidget {
  const BottomActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.chevron_left, color: kOnSurfaceVariant, size: 20),
        const SizedBox(width: 4),
        Text(
          "You're making steady headway today",
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: kPrimaryContainer,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: kPrimaryContainer.withValues(alpha: 0.45),
                blurRadius: 20,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.add, color: kCardBackgroundColor, size: 28),
          ),
        ),
      ],
    );
  }
}
