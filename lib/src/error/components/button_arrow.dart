import 'package:flutter/material.dart';

class ButtonArrow extends StatelessWidget {
  final Function press;
  const ButtonArrow({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
      margin: const EdgeInsets.all(10),
      child: TextButton(
        onPressed: press(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Text(
                'Trở lại',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
