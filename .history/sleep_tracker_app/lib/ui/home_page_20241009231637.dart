import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker_app/data/styles.dart';
import 'package:sleep_tracker_app/ui/graph.dart';
import 'package:sleep_tracker_app/models/timer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration _timer = Duration(hours: 5, minutes: 3, seconds: 12);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Countdown(sleepTime: _timer),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    height: 1.0,
                    color: CupertinoColors.systemGrey.withOpacity(0.5), // Divider
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Expanded(
                child: _buildContentWithGradient(), // Gradient wraps entire content
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentWithGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CupertinoColors.white,
            CupertinoColors.extraLightBackgroundGray
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: const Text(
              "Sleeping time",
              style: Styles.graySubtitle,
            ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 2.0,
            child: Container(
              margin: const EdgeInsets.all(24),
              child: const BarChartSample3(),
            ),
          ),
          _buildSleepInfoSection(),
        ],
      ),
    );
  }

  Widget _buildSleepInfoSection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Internal padding for content
        color: CupertinoColors.extraLightBackgroundGray.withOpacity(0), // No additional background
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: const Text(
                "Why sleep is important",
                style: TextStyle(
                  fontSize: 24, // Larger font for emphasis
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSleepInfoCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepInfoCards() {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildSleepInfoCard("If you want to break a world record..."),
          buildSleepInfoCard("Want to avoid becoming a grumpy cat?"),
          buildSleepInfoCard("Ever tried to solve a puzzle..."),
        ],
      ),
    );
  }

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
}
