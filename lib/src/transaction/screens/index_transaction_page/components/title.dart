import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../transaction_page/pages/info_charity_page/index.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
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
                child: Center(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Text(
              'MINH CHỨNG',
              style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(14, 152, 210, 1)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InfoCharity()),
                  );
                },
                child: Text('Xem giao dịch'))
          ],
        ),
      ),
      SizedBox(height: 28),
      Text(
        'Danh sách người tham gia vào hệ thống',
        style: GoogleFonts.raleway(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(35, 45, 94, 1)),
      ),
      SizedBox(height: 8),
      Text(
        'Thông tin người đóng góp đã tham gia vào chiến dịch',
        style: GoogleFonts.raleway(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.withOpacity(0.75)),
      ),
    ]);
  }
}
