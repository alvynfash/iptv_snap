import 'package:flutter/material.dart';

Widget tabBarItem({String text, bool isSelected = false, Function onTap}) {
  return GestureDetector(
    onTap: onTap?.call,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 23,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        SizedBox(
          width: 50,
          child: Divider(
            thickness: 3.5,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ),
      ],
    ),
  );
}
