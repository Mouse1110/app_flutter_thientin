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
              color: Color.fromRGBO(35, 45, 94, 1),
              fontSize: 16,
              fontWeight: FontWeight.w700)),
    );
  }
}
