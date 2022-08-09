import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constant.dart';

class TitlteAnother extends StatelessWidget {
  const TitlteAnother({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 5,
            color: fontColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Chiến dịch khác',
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w700, color: fontColor),
          ),
        ],
      ),
    );
  }
}
