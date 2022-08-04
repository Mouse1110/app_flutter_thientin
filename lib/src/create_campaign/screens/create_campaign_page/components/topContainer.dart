import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color.fromRGBO(88, 145, 255, 1),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2))
          ]),
      margin: EdgeInsets.symmetric(vertical: 24),
      //padding: EdgeInsets.symmetric(vertical: 21, horizontal: 16),
      child: Stack(
        children: [
          Positioned(
              right: 52,
              top: -23,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.25)),
              )),
          Positioned(
              right: -12,
              bottom: -11,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.25)),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(
                    Icons.warning_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Bạn có thể khởi tạo chiến dịch mới để hỗ trợ cộng đồng",
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
