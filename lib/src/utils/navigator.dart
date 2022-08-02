import 'package:flutter/material.dart';

class BlocNavigator {
  Future<void> push(
      {required BuildContext context, required Widget page}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => page));
    });
  }
}
