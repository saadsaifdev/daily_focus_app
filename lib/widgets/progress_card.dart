import 'package:daily_focus_app/constants.dart';
import 'package:flutter/material.dart'; 

class ProgressCard extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const ProgressCard({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    final double progressPercentage = totalTasks == 0
        ? 0.0
        : (completedTasks / totalTasks);

    final int percentageText = (progressPercentage * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardActiveColor,
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                "TODAY'S PROGRESS",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Focused Momentum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  '$completedTasks of $totalTasks tasks completed',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  progressPercentage == 1.0
                      ? "Incredible work! You crushed all tasks today. 🔥"
                      : "Keep pacing yourself, you're ahead of schedule.",
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 60,
              height: 60,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 5,
                    color: kSurfaceHighestColor,
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [kPrimaryContainer, kSecondaryColor],
                      ).createShader(bounds);
                    },
                    child: CircularProgressIndicator(
                      value: progressPercentage,
                      strokeWidth: 5,
                      color: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Center(
                    child: Text(
                      '$percentageText%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: [
                const LinearProgressIndicator(
                  value: 0.0,
                  minHeight: 5,
                  backgroundColor: kSurfaceHighestColor,
                ),
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [kPrimaryContainer, kSecondaryColor],
                    ).createShader(bounds);
                  },
                  child: LinearProgressIndicator(
                    value: progressPercentage, 
                    minHeight: 5,
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}