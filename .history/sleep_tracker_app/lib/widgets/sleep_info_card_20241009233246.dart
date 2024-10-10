import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker_app/data/styles.dart';

Widget buildSleepInfoCard(String text) {
  return Container(
    width: 300,
    // margin: const EdgeInsets.symmetric(horizontal: 16.0),
    margin: ,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(20), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Subtle shadow
          spreadRadius: 1, // Less spread
          blurRadius: 10,  // Blur for smooth shadow
          offset: Offset(0, 2),  // Smaller vertical offset to allow top/bottom shadows
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400, // Regular weight for the body text
              color: CupertinoColors.black,
              height: 1.5, // Line height for better readability
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16), // More space between text and icon
        Icon(
          CupertinoIcons.check_mark_circled_solid, // Larger and bolder icon
          color: CupertinoColors.activeBlue, // Active blue color for contrast
          size: 28,
        ),
      ],
    ),
  );
}
