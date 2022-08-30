import 'package:app_flutter_thientin/src/tranfers/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiverList extends StatelessWidget {
  const ReceiverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text('Danh sách người nhận',
          style: GoogleFonts.bitter(
              color: colorTranfers, fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
