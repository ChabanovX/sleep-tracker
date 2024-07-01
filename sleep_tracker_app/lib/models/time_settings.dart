import 'package:hive/hive.dart';

part 'time_settings.g.dart';

@HiveType(typeId: 0)
class TimeSettings extends HiveObject {
  @HiveField(0)
  DateTime bedTime;

  @HiveField(1)
  DateTime wakeUpTime;

  @HiveField(2)
  List<bool> activeDays; // List of 7 booleans to represent active days (Mon-Sun)

  TimeSettings({
    required this.bedTime,
    required this.wakeUpTime,
    required this.activeDays,
  });
}
