// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker_app/data/styles.dart';

import "package:sleep_tracker_app/test.dart";

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
              const Column(
                children: [
                  Text("12:42:11",
                      style: Styles.titleBold), // Should be logic with timer
                  Text("Time left before bed 😴", style: Styles.subtitle),
                  SizedBox(height: 16.0),
                  Divider(
                    thickness: 1.0,
                    indent: 32.0,
                    endIndent: 32.0,
                  ),
                  SizedBox(height: 16.0),
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
                      child: Text("Weekly Statistics", style: Styles.titleBold),
                    ),
                    const SizedBox(height: 16.0),
                    AspectRatio(
                      aspectRatio: 2.0,
                      child: Container(
                        margin: const EdgeInsets.all(24.0),
                        child: BarChartSample3(),
                      ),
                    ),
                    // const SizedBox(height: 32.0),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 32.0),
                // child: Text("LOL LOASDA", style: Styles.titleBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
