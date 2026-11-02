import 'package:daily_focus_app/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryContainer : kCardBackgroundColor,
          borderRadius: BorderRadius.circular(20), 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? const Color(0xFF1E1E96) : Colors.grey.shade400,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF1E1E96) : Colors.grey.shade300,
                fontWeight: FontWeight.w600, 
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}