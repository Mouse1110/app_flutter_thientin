import 'package:charts_flutter/flutter.dart' as charts;

class TranSeries {
  final DateTime year;
  String amount;
  final charts.Color color;
  TranSeries({
    required this.amount,
    required this.color,
    required this.year,
  });
}
