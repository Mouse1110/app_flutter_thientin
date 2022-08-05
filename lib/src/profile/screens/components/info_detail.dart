import 'package:app_flutter_thientin/src/tranfers/screens/tranfer_page/components/amount_money.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login/models/user_model.dart';

class InfoDetail extends StatelessWidget {
  InfoDetail({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.phone,
                size: 30,
                color: Colors.blue,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                phone,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.attach_money,
                size: 30,
                color: Color.fromARGB(255, 228, 206, 4),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  'a',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
