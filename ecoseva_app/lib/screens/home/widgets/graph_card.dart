import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../common/colors.dart';

class GraphCard extends ConsumerWidget {
  final String title;
  final String centerText;
  final Map<String, double> dataMap;
  final Color primaryColor;

  final BorderRadiusGeometry? borderRadius;
  const GraphCard({
    super.key,
    required this.centerText,
    required this.title,
    required this.dataMap,
    required this.primaryColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            title,
            softWrap: true,
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          PieChart(
            dataMap: dataMap,
            legendOptions: const LegendOptions(
              showLegends: false,
            ),
            chartType: ChartType.ring,
            chartRadius: 70,
            colorList: [
              primaryColor,
              Colors.white,
            ],
            centerTextStyle: textTheme.bodyMedium,
            ringStrokeWidth: 8,
            initialAngleInDegree: pi / 2,
            centerText: centerText,
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
            ),
          ),
        ],
      ),
    );
  }
}
