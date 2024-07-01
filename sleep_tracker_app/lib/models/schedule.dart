import 'package:flutter/cupertino.dart';

enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class FullSchedule extends ChangeNotifier {
  List<DaySchedule> days = [];
  late Duration timeBeforeNotification;

  FullSchedule() {
    for (int i = 0; i < 7; i++) {
      days.add(DaySchedule(day: Day.values[i]));
    }
    // Test
    days[0].setSchedule(Duration(hours: 23, minutes: 0, seconds: 0), Duration(hours: 6, minutes: 0, seconds: 0));

  }
  bool isDayOff(int day) {
    return days[day].isDayOff;
  }

  void changeTimeBeforeNotification(Duration time) {
    timeBeforeNotification = time;
    notifyListeners();
  }

  void setSchedule(Day day, Duration start, Duration end) {
    days[day.index].setSchedule(start, end);
    notifyListeners();
  }

  void deleteSchedule(Day day) {
    days[day.index].isDayOff = true;
    notifyListeners();
  }

  Duration get todaySleepDuration {
    if (isDayOff(DateTime.now().weekday - 1)) {
      return Duration.zero;
    }
    return days[DateTime.now().weekday - 1].start;
  }
}

class DaySchedule {
  Day day;
  bool isDayOff = true;
  late Duration start;
  late Duration end;

  DaySchedule({required this.day});

  void setSchedule(Duration start, Duration end) {
    this.start = start;
    this.end = end;
    isDayOff = false;
  }
}
