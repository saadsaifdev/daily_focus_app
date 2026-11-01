import 'package:daily_focus_app/constants.dart';
import 'package:daily_focus_app/widgets/custom_search_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.searchIcon,
  });
  final String title;
  final IconData searchIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        CustomSearchIcon(icon: searchIcon),
      ],
    );
  }
}
