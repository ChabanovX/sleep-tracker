import 'package:fl_chart/fl_chart.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:sleep_tracker_app/models/time_settings.dart';
import 'package:sleep_tracker_app/ui/providers/time_settings_provider.dart';

class _BarChart extends ConsumerStatefulWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  ConsumerState<_BarChart> createState() => _BarChartState();
}

class _BarChartState extends ConsumerState<_BarChart> {
  late List<double> sleepData = List.filled(7, 0.0);

  @override
  Widget build(BuildContext context) {
    // final timeSettings = ref.watch(timeSettingsProvider);

    // if (timeSettings != null) {
    //   sleepData = List.generate(7, (index) {
    //     if (timeSettings.activeDays[index]) {
    //       final bedTime = timeSettings.bedTime;
    //       final wakeUpTime = timeSettings.wakeUpTime;
    //       final sleepDuration = wakeUpTime.difference(bedTime).inHours.toDouble();
    //       return sleepDuration < 0 ? sleepDuration + 24 : sleepDuration; // Adjust for overnight sleep
    //     } else {
    //       return 0.0;
    //     }
    //   });
    // }

    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => CupertinoColors.extraLightBackgroundGray,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false, reservedSize: 30),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.blueAccent,
          Colors.deepPurple,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => sleepData.map((value) {
        return BarChartGroupData(
          x: sleepData.indexOf(value),
          barRods: [
            BarChartRodData(
              toY: value,
              gradient: _barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        );
      }).toList();
}

class BarChartSample3 extends ConsumerStatefulWidget {
  const BarChartSample3({Key? key}) : super(key: key);

  @override
  ConsumerState<BarChartSample3> createState() => BarChartSample3State();
}

class BarChartSample3State extends ConsumerState<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: const _BarChart(),
    );
  }
}
