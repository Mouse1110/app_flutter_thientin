import 'package:flutter/material.dart';

class Popup {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String body,
    Function? back,
    required Function accept,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy bỏ'),
              onPressed: () {
                back == null ? Navigator.of(context).pop() : back();
              },
            ),
            TextButton(
              child: const Text('Xác nhận'),
              onPressed: () {
                accept();
              },
            ),
          ],
        );
      },
    );
  }
}
