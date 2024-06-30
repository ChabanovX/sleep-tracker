enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class FullSchedule {
  List<DaySchedule> days = [];

  FullSchedule() {
    for (int i = 0; i < 7; i++) {
      days.add(DaySchedule(day: Day.values[i]));
    }
  }

  bool isDayOff(Day day) {
    return days[day.index].isDayOff;
  }
}

class DaySchedule {
  Day day;
  bool isDayOff = true;
  late DateTime start;
  late DateTime end;

  DaySchedule({required this.day});
}
