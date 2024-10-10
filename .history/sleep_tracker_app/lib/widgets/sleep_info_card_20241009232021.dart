import 'package:flutter/cupertino.dart';

import 'package:sleep_tracker_app/data/styles.dart';

Widget buildSleepInfoCard(String text) {
  return Container(
    width: 300,
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(20), // More rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Slightly darker shadow for depth
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 3),
        ),
      ],
      gradient: LinearGradient( // Subtle gradient background
        colors: [
          CupertinoColors.systemGrey6.withOpacity(0.5),
          CupertinoColors.white,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
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
