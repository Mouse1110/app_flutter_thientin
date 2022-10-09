import 'package:app_flutter_thientin/src/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_contants.dart';

class InfoTransaction extends StatelessWidget {
  const InfoTransaction({
    Key? key,
    required this.amount,
    required this.hash,
    required this.type,
    required this.onClick,
    required this.hint,
  }) : super(key: key);
  final String amount;
  final String hash;
  final String type;
  final Function onClick;
  final bool hint;
  @override
  Widget build(BuildContext context) {
    print(hint);
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  width: !hint ? 0.5 : 1,
                  color: !hint
                      ? const Color.fromRGBO(14, 152, 210, 1)
                      : Colors.red)),
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
                        color: const Color.fromRGBO(255, 221, 0, 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(MoneyFormat.formatMoney(amount),
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: colorTran,
                              ))),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(hash,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
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
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              topRight: Radius.circular(45)),
                        ),
                        child: Align(
                          alignment: const Alignment(-0.05, 0.05),
                          child: Text(type == "Từ" ? "Ủng hộ" : "Được nhận",
                              style: const TextStyle(
                                  fontSize: 10,
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
