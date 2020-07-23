import 'package:flutter/material.dart';

Widget headerTile(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 19,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
}
