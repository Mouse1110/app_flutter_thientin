import 'dart:async';

import 'package:app_flutter_thientin/src/transaction/models/info_transaction_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/transaction_model.dart';
import '../../models/transaction_series.dart';

class TransactionDataValidation {
  String hash = '0';
  List<FlSpot> flspots = [FlSpot(0, 1)];

  List<TranSeries> lTranSeries = [];

  final _transactions = BehaviorSubject<List<TransactionModel>>();
  final _transaction = BehaviorSubject<InfoTransactionModel>();
  final _transactionSave = BehaviorSubject<int>();
  final _chart = BehaviorSubject<List<charts.Series<TranSeries, String>>>();
  dispose() {
    _transactions.close();
  }

  //Get
  Stream<List<TransactionModel>> get streamTransaction => _transactions.stream;
  Stream<InfoTransactionModel> get streamInfoTransaction => _transaction.stream;
  Stream<int> get streamTransactionSave => _transactionSave.stream;
  Stream<List<charts.Series<TranSeries, String>>> get streamSeries =>
      _chart.stream;
  // Set
  Function(List<TransactionModel>) get addTransaction => _transactions.sink.add;
  Function(int) get addTransactionSave => _transactionSave.sink.add;
  Function(InfoTransactionModel) get addInfoTransaction =>
      _transaction.sink.add;
  Function(List<charts.Series<TranSeries, String>>) get addSeries =>
      _chart.sink.add;

  // Event
  void setHashIndex(String hash) {
    this.hash = hash;
  }

  Future<void> chartShow(List<TransactionModel> list) async {
    for (int i = 0; i < list.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500)).then((value) {
        if (lTranSeries.length == 0) {
          TranSeries seriesTran = TranSeries(
              amount: list[i].amount,
              color: charts.ColorUtil.fromDartColor(
                const Color(0xff23b6e6),
              ),
              year: DateTime.fromMillisecondsSinceEpoch(list[i].date * 1000));
          lTranSeries.add(seriesTran);
          List<charts.Series<TranSeries, String>> series = [
            charts.Series(
              id: "Tran",
              data: lTranSeries,
              domainFn: (TranSeries series, _) =>
                  '${series.year.day}-${series.year.month}-${series.year.year}',
              measureFn: (TranSeries series, _) => double.parse(series.amount),
              colorFn: (TranSeries series, _) => series.color,
            ),
          ];

          addSeries(series);
        } else {
          DateTime startDate = lTranSeries[lTranSeries.length - 1].year;
          DateTime endDate =
              DateTime.fromMillisecondsSinceEpoch(list[i].date * 1000);
          double amount = double.tryParse(list[i].amount)!;
          if (startDate.year == endDate.year) {
            if (startDate.month == endDate.month) {
              if (startDate.day == endDate.day) {
                amount += double.tryParse(list[i].amount)!;
              }
            }
          }
          TranSeries seriesTran = TranSeries(
              amount: '$amount',
              color: charts.ColorUtil.fromDartColor(
                const Color(0xff23b6e6),
              ),
              year: endDate);
          lTranSeries.add(seriesTran);
          List<charts.Series<TranSeries, String>> series = [
            charts.Series(
              id: "Tran",
              data: lTranSeries,
              domainFn: (TranSeries series, _) =>
                  '${series.year.day}-${series.year.month}-${series.year.year}',
              measureFn: (TranSeries series, _) => double.parse(series.amount),
              colorFn: (TranSeries series, _) => series.color,
            ),
          ];

          addSeries(series);
        }
      });
    }
  }
}
