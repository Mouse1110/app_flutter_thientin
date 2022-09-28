import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'components/button_arrow.dart';

class ErrorPage extends StatelessWidget {
  String message;
  ErrorPage({Key? key, this.message = ""}) : super(key: key);

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
              'Có lỗi xảy ra',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Lottie.network(
                  'https://assets4.lottiefiles.com/private_files/lf30_3X1oGR.json'),
            ),
            Column(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonArrow(
                  press: () {
                    pop(context: context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Future<void> push(
      {required BuildContext context, String error = "Có lỗi xảy ra"}) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => ErrorPage(
                  message: error,
                )));
  }

  static Future<void> pop({required BuildContext context}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }
}
