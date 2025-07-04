import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomMoney extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text);
    final money = NumberFormat("###,###,###", "en_us");
    String newText = money.format(value);
    return newValue.copyWith(
        text: newText + ' VNĐ',
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
