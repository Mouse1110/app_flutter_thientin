import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constant.dart';

class ButtonEvent extends StatelessWidget {
  final String text;
  final Function press;
  final bool init;
  const ButtonEvent({
    Key? key,
    required this.press,
    required this.text,
    required this.init,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1, color: !init ? backgroundButton : Colors.white),
          color: init ? backgroundButton : Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
                color: !init ? backgroundButton : Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
