import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/info_transaction_blockchain.dart';
import 'components/title.dart';

class InfoTransaction extends StatelessWidget {
  const InfoTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TitleComponentTransaction(),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin transaction',
                      style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(35, 45, 94, 1)),
                    ),
                    SizedBox(height: 20),
                    InfoTransactionBlockChain(),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
