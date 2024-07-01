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
          Day.Tue, const Duration(hours: 23), const Duration(hours: 7));
      expect(schedule.days[1].isDayOff, false);
      expect(schedule.days[1].start, const Duration(hours: 23));
      expect(schedule.days[1].end, const Duration(hours: 7));
    });

    test('deleteSchedule should work properly', () {
      final schedule = FullSchedule();
      schedule.deleteSchedule(Day.Mon);
      expect(schedule.days[0].isDayOff, true);
    });
  });
}
