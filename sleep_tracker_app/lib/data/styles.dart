import "package:flutter/cupertino.dart";

abstract class Styles {
  static const TextStyle title = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle graySubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: CupertinoColors.secondaryLabel,
  );

  static const Color textColor = CupertinoColors.label;
}