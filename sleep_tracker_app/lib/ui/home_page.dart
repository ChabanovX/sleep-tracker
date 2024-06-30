import 'package:flutter/cupertino.dart';
import 'package:sleep_tracker_app/data/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("17:00", style: Styles.title),
            Text("Lol", style: Styles.subtitle),
            Text("Test", style: Styles.graySubtitle),
          ],
        ),
      ),
    );
  }
}
