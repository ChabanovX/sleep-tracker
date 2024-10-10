import 'package:flutter/cupertino.dart';

import 'package:sleep_tracker_app/data/styles.dart';
import 'package:sleep_tracker_app/ui/graph.dart';
import 'package:sleep_tracker_app/models/timer.dart';
import 'package:sleep_tracker_app/widgets/sleep_info_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration _timer = Duration(hours: 5, minutes: 3, seconds: 12);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: B,
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
          buildSleepInfoCard("If you want to break a world record, try the bed-jumping competition! Getting enough sleep can boost your athletic performance, making you leap higher, run faster, and even excel at extreme pillow fighting."),
          buildSleepInfoCard("Ever tried to solve a puzzle while sleep-deprived? It’s like searching for a needle in a haystack! Adequate sleep sharpens your mind, so you can conquer crosswords and remember where you left your keys (or at least the general vicinity)."),
          buildSleepInfoCard("Want to avoid becoming a grumpy cat? A good night's sleep can turn your I hate Mondays mood into I love every day, preventing you from turning into a human-shaped raincloud."),
        ],
      ),
    );
  }
}
