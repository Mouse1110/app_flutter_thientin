import 'dart:async';
import 'package:app_flutter_thientin/src/utils/money_format.dart';

import 'package:rxdart/rxdart.dart';

class DonateDataValidation {
  String total = '0';
  final _id = BehaviorSubject<int>();
  final _total = BehaviorSubject<String>();
  final _input = BehaviorSubject<String>();
  final _button = BehaviorSubject<String>();
  dispose() {
    _id.close();
  }

  //Get
  Stream<int> get streamid => _id.stream;
  Stream<String> get streamInput => _input.stream.transform(validateInput);
  Stream<String> get streamTotal => _total.stream.transform(validateTotal);
  Stream<bool> get streamButton =>
      Rx.combineLatest2(streamInput, streamTotal, ((a, b) {
        double amountA = 0;
        List<String> listMoney = '${a}'.split(',');
        String money = '';
        listMoney.forEach((element) {
          money += element;
        });
        amountA = double.tryParse(money.split(' ')[0])!;
        double amountB = 0;
        listMoney = '${b}'.split(',');
        money = '';
        listMoney.forEach((element) {
          money += element;
        });
        amountB = double.tryParse(money.split(' ')[0])!;
        if (amountA > amountB) {
          return false;
        }
        return true;
      }));
  // Set
  Function(int) get addId => _id.sink.add;
  void addInput(String data) {
    _input.sink.add(data);
  }

  void addTotal(String data) {
    _total.sink.add(data);
    total = data;
  }

  // Tranformers
  final validateInput =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    double amount = 0;
    List<String> listMoney = data.split(',');
    String money = '';
    listMoney.forEach((element) {
      money += element;
    });
    try {
      amount = double.tryParse(money.split(' ')[0])!;
      print(amount);
    } catch (e) {
      sink.addError('Số tiền không đúng');
      return;
    }
    if (money.length < 5) {
      sink.addError("Số tiền quá nhỏ");
      return;
    }
    sink.add(money);
  }));

  final validateTotal =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    sink.add(MoneyFormat.formatMoney(data));
  }));

  // Event
  int formatMoney(String result) {
    int amount = 0;
    List<String> listMoney = result.split(',');
    String money = '';
    listMoney.forEach((element) {
      money += element;
    });
    amount = int.tryParse(money.split(' ')[0])!;
    return amount;
  }
}
