import 'package:daily_focus_app/constants.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(
                  '2 of 6 tasks completed',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                SizedBox(height: 4),
                Text(
                  "Keep pacing yourself, you're ahead of schedule.",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
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
                    child: const CircularProgressIndicator(
                      value: 0.33,
                      strokeWidth: 5,
                      color: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const Center(
                    child: Text(
                      '33%',
                      style: TextStyle(
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
                  child: const LinearProgressIndicator(
                    value: 0.66,
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
