import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountMoney extends StatelessWidget {
  const AmountMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('Số tiền còn lại',
            style: GoogleFonts.raleway(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        SizedBox(height: 10),
        Text('1.000.000 VND',
            style: GoogleFonts.readexPro(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(35, 45, 94, 1))),
        SizedBox(height: 30),
      ],
    );
  }
}
