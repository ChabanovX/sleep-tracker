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
                  const Divider(thickness: 1, indent: 32, endIndent: 32),
                  const SizedBox(height: 16),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildSleepChartSection(),
                    _buildSleepInfoSection(),
                    const Expanded(child: SizedBox(25)), // Space at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSleepChartSection() {
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
            padding: const EdgeInsets.only(left: 32.0),
            child: const Text("Sleeping time", style: Styles.graySubtitle),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 2.0,
            child: Container(
              margin: const EdgeInsets.all(24),
              child: const BarChartSample3(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSleepInfoSection() {
    return Container(
      color: CupertinoColors.extraLightBackgroundGray,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: const Text("Why sleep is important", style: Styles.midtitleBold),
          ),
          const SizedBox(height: 16),
          _buildSleepInfoCards(),
        ],
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
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: Styles.subtitle,
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
      ),
    );
  }
}
