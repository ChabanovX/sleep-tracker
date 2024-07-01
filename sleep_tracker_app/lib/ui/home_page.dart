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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
      ),
      child: SafeArea(
        child: Container(
          color: CupertinoColors.white,
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
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 32.0),
                      child: const Text("Why sleep is important",
                          style: Styles.graySubtitle),
                    ),
                    Container(
                      height: 300,
                      width: 600,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            // Widget
                            width: 300,
                            padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            child: Container(
                              color: CupertinoColors.systemGrey,
                              child: Center(
                                child: Text("test"),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            child: Container(
                              color: CupertinoColors.systemGrey,
                              child: Center(
                                child: Text("test"),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            child: Container(
                              color: CupertinoColors.systemGrey,
                              child: Center(
                                child: Text("test"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
