import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_contants.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    Key? key,
    required this.back,
  }) : super(key: key);
  final Function back;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                back();
              },
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
                child: const Center(child: Icon(Icons.arrow_back)),
              ),
            ),
            Text(
              'THIỆN TÍN',
              style: GoogleFonts.bitter(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: const Color.fromRGBO(14, 152, 210, 1)),
            ),
            const SizedBox(
              height: 36,
              width: 36,
            ),
          ],
        ),
      ),
      const SizedBox(height: 28),
      const Text(
        'Thông tin từ thiện',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: colorTran),
      ),
      const SizedBox(height: 8),
      Text(
        'Hiển thị thông tin qua từng ngày của quỹ đóng góp',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.withOpacity(0.75)),
      ),
    ]);
  }
}
