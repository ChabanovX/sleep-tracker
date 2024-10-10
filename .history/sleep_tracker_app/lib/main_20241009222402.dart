import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import "package:awesome_notifications/awesome_notifications.dart";

import 'package:sleep_tracker_app/models/schedule.dart';
import 'package:sleep_tracker_app/models/time_settings.dart';
import 'package:sleep_tracker_app/ui/home_page.dart';
import 'package:sleep_tracker_app/ui/settings_page.dart';

void main() async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: "channelKey",
          channelName: "channelName",
          channelDescription: "channelDescription")
    ],
    debug: true,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TimeSettingsAdapter());
  await Hive.openBox<TimeSettings>('timeSettings');

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      debugShowCheckedModeBanner: true,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye),
              label: "Settings",
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return <Widget>[
            HomePage(),
            SettingsPage(),
          ][index];
        },
      ),
    );
  }
}
