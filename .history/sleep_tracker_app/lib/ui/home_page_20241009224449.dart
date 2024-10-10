
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sleep_tracker_app/data/styles.dart';
import "package:sleep_tracker_app/ui/graph.dart";
import "package:sleep_tracker_app/models/timer.dart";

import 'package:sleep_tracker_app/widgets/sleep_info_card.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final timeSettings = ref.watch(timeSettingsProvider) ??
    //     TimeSettings(
    //       bedTime: DateTime.now(),
    //       wakeUpTime: DateTime.now(),
    //       activeDays: List.filled(7, false),
    //     );
    Duration _timer = Duration(
        hours: 5,
        minutes: 3,
        seconds: 12);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      child:
                              Countdown(sleepTime: _timer),
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
                Container(
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
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 32.0),
                        child: const Text("Sleeping time",
                            style: Styles.graySubtitle),
                      ),
                      const SizedBox(height: 16.0),
                      AspectRatio(
                        aspectRatio: 2.0,
                        child: Container(
                          margin: const EdgeInsets.all(24.0),
                          child:
                              const BarChartSample3(), // TODO Add schedules there
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: CupertinoColors.extraLightBackgroundGray,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: const EdgeInsets.fromLTRB(left: 32.0),
                              child: Center(
                                child: const Text("Why sleep is important",
                                    style: Styles.midtitleBold),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: 600,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  buildSleepInfoCard("If you want to break a world record, try the bed-jumping competition! Getting enough sleep can boost your athletic performance, making you leap higher, run faster, and even excel at extreme pillow fighting."),
                                  buildSleepInfoCard("Want to avoid becoming a grumpy cat? A good night's sleep can turn your I hate Mondays mood into I love every day, preventing you from turning into a human-shaped raincloud."),
                                  buildSleepInfoCard("Ever tried to solve a puzzle while sleep-deprived? It’s like searching for a needle in a haystack! Adequate sleep sharpens your mind, so you can conquer crosswords and remember where you left your keys (or at least the general vicinity)."),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: CupertinoColors.extraLightBackgroundGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
