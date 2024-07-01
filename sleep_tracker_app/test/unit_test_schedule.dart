import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sleep_tracker_app/models/schedule.dart';

void main() {
  group('Test setSchedule, deleteSchedule, isDayOff from Schedule', () {
    test("Monday shouldn't be off day", () {
      final schedule = FullSchedule();
      expect(schedule.days[0].isDayOff, false);
    });

    test("setSchedule should work properly", () {
      final schedule = FullSchedule();
      schedule.setSchedule(
          Day.tuesday, Duration(hours: 23), Duration(hours: 7));
      expect(schedule.days[1].isDayOff, false);
      expect(schedule.days[1].start, Duration(hours: 23));
      expect(schedule.days[1].end, Duration(hours: 7));
    });

    test('deleteSchedule should work properly', () {
      final schedule = FullSchedule();
      schedule.deleteSchedule(Day.monday);
      expect(schedule.days[0].isDayOff, true);
    });
  });
}
