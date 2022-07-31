import 'package:flutter/material.dart';

class ButtonArrowBack extends StatelessWidget {
  const ButtonArrowBack({Key? key, required this.press}) : super(key: key);
  final Function press;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.only(left: 30),
        onPressed: press(),
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ));
  }
}
