import 'package:animate_do/animate_do.dart';

import 'package:app_flutter_thientin/src/login/constants/color_contants.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'pages/bottom_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: login_background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40),
              child: Text(
                'Đăng nhập',
                style: GoogleFonts.bitter(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
              child: Text(
                'Đăng nhập với số điện thoại và mật khẩu để đến với chúng tôi',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child: FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: const BottomPage(),
            )),
          ],
        ),
      ),
    );
  }
}
