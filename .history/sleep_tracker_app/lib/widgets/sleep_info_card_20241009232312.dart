import 'package:flutter/cupertino.dart';

import 'package:sleep_tracker_app/data/styles.dart';

  Widget buildSleepInfoCard(String text) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: Styles.subtitle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          const Icon(
            CupertinoIcons.check_mark,
            color: CupertinoColors.activeBlue,
          ),
        ],
      ),
    );
  }