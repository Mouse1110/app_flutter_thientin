import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text('CHIẾN DỊCH NỔI BẬT',
          style: GoogleFonts.roboto(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
    );
  }
}
