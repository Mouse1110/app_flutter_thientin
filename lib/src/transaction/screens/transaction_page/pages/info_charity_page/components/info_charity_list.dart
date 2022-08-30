import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/color_contants.dart';

class InfoCharityList extends StatelessWidget {
  const InfoCharityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.5, color: colorTitle)),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 221, 0, 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text('amount',
                              style: GoogleFonts.raleway(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: colorTran,
                              ))),
                    ),
                    Container(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('hash',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: colorTran)),
                          Text('Giao dịch ủng hộ của nhà từ thiện',
                              style: GoogleFonts.raleway(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: colorTran.withOpacity(0.5))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 128 / 2,
                        width: 128 / 2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              topRight: Radius.circular(45)),
                        ),
                        child: Align(
                          alignment: Alignment(-0.05, 0.05),
                          child: Text('type',
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
