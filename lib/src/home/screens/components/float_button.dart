import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatButton extends StatelessWidget {
  final Function press;
  const FloatButton({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(14, 152, 210, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month_outlined, color: Colors.white),
            const SizedBox(width: 20),
            Text('Khởi tạo chiến dịch',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
