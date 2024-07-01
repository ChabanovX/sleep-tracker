enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class FullSchedule {
  List<DaySchedule> days = [];
  late Duration timeBeforeNotification;

  FullSchedule() {
    for (int i = 0; i < 7; i++) {
      days.add(DaySchedule(day: Day.values[i]));
    }
  }
  bool isDayOff(Day day) {
    return days[day.index].isDayOff;
  }

  void changeTimeBeforeNotification(Duration time) {
    timeBeforeNotification = time;
  }

  void setSchedule(Day day, DateTime start, DateTime end) {
    days[day.index].setSchedule(start, end);
  }

  void deleteSchedule(Day day) {
    // TODO: implement
  }
}

class DaySchedule {
  Day day;
  bool isDayOff = true;
  late DateTime start;
  late DateTime end;

  DaySchedule({required this.day});

  void setSchedule(DateTime start, DateTime end) {
    this.start = start;
    this.end = end;
    if (start.isBefore(end)) {
      isDayOff = false;
    }
  }
}
