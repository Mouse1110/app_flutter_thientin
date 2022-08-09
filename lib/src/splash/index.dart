import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'THIỆN TÍN',
              style: GoogleFonts.raleway(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            Lottie.network(
                'https://assets6.lottiefiles.com/private_files/lf30_fup2uejx.json'),
            Text(
              'Kết nối nền tảng lưu trữ toàn cầu.\nMong bạn chờ trong giây lát!',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
