import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: Center(child: Icon(Icons.arrow_back)),
              ),
            ),
            Text(
              'THIỆN TÍN',
              style: GoogleFonts.bitter(
                  fontSize: 22, color: Color.fromRGBO(14, 152, 210, 1)),
            ),
            Container(
              height: 36,
              width: 36,
            ),
          ],
        ),
      ),
      SizedBox(height: 28),
      Text(
        'Thông tin từ thiện',
        style: GoogleFonts.raleway(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(35, 45, 94, 0.75)),
      ),
      SizedBox(height: 8),
      Text(
        'Hiển thị thông tin qua từng ngày của quỹ đóng góp',
        style: GoogleFonts.raleway(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.withOpacity(0.75)),
      ),
    ]);
  }
}
