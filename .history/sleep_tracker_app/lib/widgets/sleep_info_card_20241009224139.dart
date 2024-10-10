

Widget buildSleepInfoCard(String text) {
  return Container(
    width: 300,
    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
    child: Container(
      color: CupertinoColors.extraLightBackgroundGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: Styles.subtitle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          Icon(
            CupertinoIcons.check_mark,
            color: CupertinoColors.activeBlue,
          ),
        ],
      ),
    ),
  );
}
