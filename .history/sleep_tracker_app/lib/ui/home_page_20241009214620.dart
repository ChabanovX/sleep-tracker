import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_tracker_app/data/styles.dart';
import 'package:sleep_tracker_app/models/time_settings.dart';
import "package:sleep_tracker_app/ui/graph.dart";
import "package:sleep_tracker_app/models/timer.dart";
import 'package:sleep_tracker_app/ui/providers/time_settings_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final timeSettings = ref.watch(timeSettingsProvider) ??
        TimeSettings(
          bedTime: DateTime.now(),
          wakeUpTime: DateTime.now(),
          activeDays: List.filled(7, false),
        );
    Duration _timer = Duration(
        hours: timeSettings.bedTime.hour,
        minutes: timeSettings.bedTime.minute,
        seconds: timeSettings.bedTime.second);

    // print(
    //     "${DateTime.now().hour * 60 * 60 + DateTime.now().minute * 60 + DateTime.now().second == _timer.inSeconds}");

    // print(
    //     "${timeSettings.bedTime.hour}, ${timeSettings.bedTime.minute}, ${timeSettings.bedTime.second}");

    if (true) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: "channelKey",
          title: "Sleep Tracker",
          body: "Time to go Sleep 😌",
        ),
        actionButtons: [
          NotificationActionButton(
            key: 'custom_action',
            label: 'Custom Action',
          ),
        ],
        schedule: NotificationCalendar(
          hour: timeSettings.bedTime.hour,
          minute: timeSettings.bedTime.minute,
        ),
      );
    }
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
                          timeSettings.activeDays[DateTime.now().day] == false
                              ? const NoneScheduleWidget()
                              : 
                              Countdown(sleepTime: _timer),
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
                                  Container(
                                    width: 300,
                                    padding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    child: Container(
                                      color: CupertinoColors
                                          .extraLightBackgroundGray,
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
                                      color: CupertinoColors
                                          .extraLightBackgroundGray,
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
                                      color: CupertinoColors
                                          .extraLightBackgroundGray,
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
