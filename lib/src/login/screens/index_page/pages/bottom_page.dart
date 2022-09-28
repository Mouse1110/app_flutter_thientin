import 'package:app_flutter_thientin/src/login/screens/login_page/index.dart';
import 'package:app_flutter_thientin/src/login/screens/signup_page/index.dart';
import 'package:app_flutter_thientin/src/login/constants/color_contants.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../../../components/flash_message_component.dart';
import '../components/title.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: login_background,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleComponent(),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 50),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        LoginPage.push(context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Đăng nhập ',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        SignUpPage.push(context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Đăng ký',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
