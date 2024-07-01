import 'package:cron/cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sleep_tracker_app/models/time_settings.dart';

import 'notification_notifier.dart';

final timeSettingsProvider =
    StateNotifierProvider<TimeSettingsNotifier, TimeSettings?>((ref) {
  final notificationNotifier = ref.read(notificationProvider.notifier);
  return TimeSettingsNotifier(notificationNotifier);
});

class TimeSettingsNotifier extends StateNotifier<TimeSettings?> {
  final NotificationNotifier notificationNotifier;
  Cron cron = Cron();

  TimeSettingsNotifier(this.notificationNotifier)
      : super(Hive.box<TimeSettings>('timeSettings').get('settings'));

  void updateBedTime(DateTime bedTime) {
    final newState = TimeSettings(
      bedTime: bedTime,
      wakeUpTime: state?.wakeUpTime ?? DateTime.now(),
      activeDays: state?.activeDays ?? List.generate(7, (index) => false),
    );
    _saveSettings(newState);
  }

  void updateWakeUpTime(DateTime wakeUpTime) {
    final newState = TimeSettings(
      bedTime: state?.bedTime ?? DateTime.now(),
      wakeUpTime: wakeUpTime,
      activeDays: state?.activeDays ?? List.generate(7, (index) => false),
    );
    _saveSettings(newState);
  }

  void updateActiveDays(List<bool> activeDays) {
    final newState = TimeSettings(
      bedTime: state?.bedTime ?? DateTime.now(),
      wakeUpTime: state?.wakeUpTime ?? DateTime.now(),
      activeDays: activeDays,
    );
    _saveSettings(newState);
  }

  void _saveSettings(TimeSettings settings) {
    Hive.box<TimeSettings>('timeSettings').put('settings', settings);
    state = settings;
  }

  void _updateNotificationSchedule() {
    final bedSchedule =
        Schedule(hours: state?.bedTime.hour, minutes: state?.bedTime.minute);
    final wakeSchedule = Schedule(
        hours: state?.wakeUpTime.hour, minutes: state?.wakeUpTime.minute);
    cron.close();
    cron = Cron();
    cron.schedule(bedSchedule, notificationNotifier.showBedNotification);
    cron.schedule(wakeSchedule, notificationNotifier.showWakeNotification);
  }
}
