import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<CupertinoThemeData> {
  ThemeNotifier() : super(CupertinoThemeData(brightness: Brightness.light));

  void toggleTheme() {
    state = state.brightness == Brightness.dark
        ? CupertinoThemeData(brightness: Brightness.light)
        : CupertinoThemeData(brightness: Brightness.dark);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, CupertinoThemeData>((ref) {
  return ThemeNotifier();
});
