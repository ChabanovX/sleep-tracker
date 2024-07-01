import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sleep_tracker_app/models/time_settings.dart';

final timeSettingsProvider = StateNotifierProvider<TimeSettingsNotifier, TimeSettings?>((ref) {
  return TimeSettingsNotifier();
});

class TimeSettingsNotifier extends StateNotifier<TimeSettings?> {
  TimeSettingsNotifier() : super(Hive.box<TimeSettings>('timeSettings').get('settings'));

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
}
