import 'package:flutter/cupertino.dart';
import 'package:sleep_tracker_app/data/styles.dart';

import 'dart:async';

class Countdown extends StatefulWidget {

  final Duration sleepTime; 
  const Countdown({super.key, required this.sleepTime});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  DateTime now = DateTime.now();

  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    startTimer();
    reset();
  }

  void reset() {
    setState(
      () {
        int nowInSeconds = now.hour * 3600 + now.minute * 60 + now.second;
        int timeLeft = widget.sleepTime.inSeconds - nowInSeconds;
        if (timeLeft < 0) {
          timeLeft = 86400 - nowInSeconds + widget.sleepTime.inSeconds;
        }
        duration = Duration(seconds: timeLeft);
      },
    );
  }

  void addTime() {
    final addSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        duration = Duration(hours: 24);
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (_) => addTime(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: buildTime(),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Column(
      children: [
        Text(
          '$hours:$minutes:$seconds',
          style: Styles.titleBold,
          textAlign: TextAlign.center,
        ),
        const Text("Time left before bed 😴", style: Styles.subtitle),
      ],
    );
  }
}

class NoneScheduleWidget extends StatelessWidget {
  const NoneScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("No schedule today", style: Styles.titleBold),
        Text("Please add schedule", style: Styles.subtitle),
      ],
    );
  }
}
