import "package:flutter/cupertino.dart";
import 'package:provider/provider.dart';

import "package:sleep_tracker_app/ui/home_page.dart";
import "package:sleep_tracker_app/ui/settings_page.dart";
import "package:sleep_tracker_app/models/schedule.dart";

int main() {
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MainApp());
  return 0;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FullSchedule()),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
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
      ),
    );
  }
}
