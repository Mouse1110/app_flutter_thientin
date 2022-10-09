import 'package:flutter/material.dart';

class TimePicker {
  static Future<DateTime?> pick(
    BuildContext context, {
    required DateTime initial,
    required DateTime first,
    required DateTime last,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );
  }
}
