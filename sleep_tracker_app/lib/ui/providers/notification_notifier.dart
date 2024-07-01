import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notification_service.dart';

class NotificationNotifier extends StateNotifier<void> {
  final NotificationService notificationService;

  NotificationNotifier(this.notificationService) : super(null);

  void showBedNotification() {
    notificationService.showNotification('Good night', 'This is the time you wanted to go to sleep');
  }

  void showWakeNotification() {
    notificationService.showNotification('Good morning', 'Wake up, you are one day closer to your best self');
  }
}

final notificationProvider = StateNotifierProvider<NotificationNotifier, void>((ref) {
  final notificationService = NotificationService();
  return NotificationNotifier(notificationService);
});
