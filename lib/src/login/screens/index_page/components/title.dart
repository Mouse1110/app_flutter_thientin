import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 30, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xin chào',
              style: GoogleFonts.bitter(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, top: 10, bottom: 20),
              child: Text(
                'Ứng dụng từ thiện sao kê minh bạch với công nghệ BLockchain. Giải pháp minh bạch cho mọi vấn đề.',
                style: GoogleFonts.roboto(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ));
  }
}
