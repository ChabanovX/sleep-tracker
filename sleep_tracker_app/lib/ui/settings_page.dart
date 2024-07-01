import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_tracker_app/data/styles.dart';
import 'package:sleep_tracker_app/models/schedule.dart';
import 'package:sleep_tracker_app/models/time_settings.dart';
import 'package:sleep_tracker_app/ui/providers/time_settings_provider.dart';

import 'providers/theme_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeSettings = ref.watch(timeSettingsProvider) ??
        TimeSettings(
          bedTime: DateTime.now(),
          wakeUpTime: DateTime.now(),
          activeDays: List.filled(7, false),
        );
    final timeSettingsNotifier = ref.read(timeSettingsProvider.notifier);
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final isDarkMode =
        ref.watch(themeNotifierProvider).brightness == Brightness.dark;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Settings"),
      ),
      child: ListView(
        children: [
          const Text('Set Alarm', style: Styles.titleBold,),
          Card(
            color: const Color.fromARGB(255, 238, 238, 238),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.bedtime_rounded,
                  ),
                  const Text(
                    'Set Bed Time:',
                    style: Styles.subtitle
                  ),
                  CupertinoButton(
                    child: Text('${timeSettings.bedTime.hour.toString().padLeft(2, '0')}:${timeSettings.bedTime.minute.toString().padLeft(2, '0')}'),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => Container(
                          height: 250,
                          color: CupertinoColors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 198,
                                child: CupertinoDatePicker(
                                  initialDateTime: timeSettings.bedTime,
                                  mode: CupertinoDatePickerMode.time,
                                  onDateTimeChanged: (DateTime newTime) {
                                    timeSettingsNotifier.updateBedTime(newTime);
                                  },
                                ),
                              ),
                              CupertinoButton(
                                child: const Text("Done"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              
                ],
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.orange,
                  ),
                  const Text(
                    'Set Wake Up Time:',
                    style: Styles.subtitle
                  ),
                  CupertinoButton(
                    child: Text('${timeSettings.wakeUpTime.hour.toString().padLeft(2, '0')}:${timeSettings.wakeUpTime.minute.toString().padLeft(2, '0')}'),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => Container(
                          height: 250,
                          color: CupertinoColors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 198,
                                child: CupertinoDatePicker(
                                  initialDateTime: timeSettings.wakeUpTime,
                                  mode: CupertinoDatePickerMode.time,
                                  onDateTimeChanged: (DateTime newTime) {
                                    timeSettingsNotifier.updateWakeUpTime(newTime);
                                  },
                                ),
                              ),
                              CupertinoButton(
                                child: const Text("Done"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50,),
          const Text("Active Days:", style: Styles.titleBold,),
          Wrap(
            spacing: 8.0,
            children: List<Widget>.generate(7, (int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    color: timeSettings.activeDays[index] ? CupertinoColors.activeBlue : Colors.grey[200],
                    onPressed: () {
                      final newActiveDays = List<bool>.from(timeSettings.activeDays);
                      newActiveDays[index] = !newActiveDays[index];
                      timeSettingsNotifier.updateActiveDays(newActiveDays);
                    },
                    child: Text(
                      Day.values[index].name,
                      style: TextStyle(
                        color: timeSettings.activeDays[index] ? CupertinoColors.white : CupertinoColors.systemBlue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
