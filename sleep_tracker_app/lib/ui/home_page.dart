// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sleep_tracker_app/data/styles.dart';
import 'package:sleep_tracker_app/models/schedule.dart';
import "package:sleep_tracker_app/ui/graph.dart";
import "package:sleep_tracker_app/models/timer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            // color: CupertinoColors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      child: context
                              .watch<FullSchedule>()
                              .isDayOff(DateTime.now().weekday - 1)
                          ? const NoneScheduleWidget()
                          : Countdown(
                              sleepTime: context
                                  .watch<FullSchedule>()
                                  .todaySleepDuration,
                            ),
                    ), // Add from current timer
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
                      // const SizedBox(height: 32.0),
                    ],
                  ),
                ),
                // const SizedBox(height: 32.0),
                Container(color: CupertinoColors.extraLightBackgroundGray,
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
                                    style: Styles.subtitleBold),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: 600,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    padding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    child: Container(
                                      color: CupertinoColors.extraLightBackgroundGray,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Center(
                                              child: Text(
                                                "If you want to break a world record, try the bed-jumping competition! Getting enough sleep can boost your athletic performance, making you leap higher, run faster, and even excel at extreme pillow fighting.",
                                                style: Styles.subtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 32),
                                          Icon(
                                            CupertinoIcons.check_mark,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    padding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    child: Container(
                                      color: CupertinoColors.extraLightBackgroundGray,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Center(
                                              child: Text(
                                                "Want to avoid becoming a grumpy cat? A good night's sleep can turn your `I hate Mondays` mood into `I love every day,` preventing you from turning into a human-shaped raincloud.",
                                                style: Styles.subtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 32),
                                          Icon(
                                            CupertinoIcons.check_mark,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    
                                    width: 300,
                                    padding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    child: Container(
                                      color: CupertinoColors.extraLightBackgroundGray,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Center(
                                              child: Text(
                                                "Ever tried to solve a puzzle while sleep-deprived? It’s like searching for a needle in a haystack! Adequate sleep sharpens your mind, so you can conquer crosswords and remember where you left your keys (or at least the general vicinity).",
                                                style: Styles.subtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 32),
                                          Icon(
                                            CupertinoIcons.check_mark,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
