import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../index_page/pages/bottom_page.dart';

class IndexLoginPage extends StatelessWidget {
  const IndexLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset('assets/icon.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Làm việc thiện phải có chữ tín',
              style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(child: FadeInUp(child: const BottomPage()))
          ],
        ),
      ),
    );
  }
}
