import 'package:app_flutter_thientin/src/tranfers/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtomArrowBack extends StatelessWidget {
  const ButtomArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back, size: 30),
          Text('THIỆN TÍN',
              style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: colorTranfer)),
          Image.asset('assets/user.png', width: 42)
        ],
      ),
    );
  }
}
