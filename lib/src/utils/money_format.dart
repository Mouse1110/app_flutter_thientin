import 'package:intl/intl.dart';

class MoneyFormat {
  static String formatMoney(String wallet) {
    final formatCurrency = new NumberFormat("#,##0.00", "en_US");
    return '${formatCurrency.format(double.parse(wallet))} VND';
  }
}
