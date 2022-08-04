import 'package:app_flutter_thientin/src/transaction/screens/transaction_page/pages/info_charity_page/components/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'components/info_charity_list.dart';

class InfoCharity extends StatefulWidget {
  const InfoCharity({Key? key}) : super(key: key);

  @override
  State<InfoCharity> createState() => _InfoCharityState();
}

class _InfoCharityState extends State<InfoCharity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TitleComponent(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 180,
                  width: 300,
                  padding: EdgeInsets.only(right: 20, top: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          width: 0.5,
                          color: Color.fromRGBO(14, 152, 210, 1)
                              .withOpacity(0.5))),
                  // child: charts.BarChart(
                  //   series,
                  //   animate: true,
                  // ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thông tin giao dịch',
                          style: GoogleFonts.raleway(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(35, 45, 94, 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    InfoCharityList(),
                    // Column(
                    //   children: lTran
                    //       .map((e) => Column(
                    //             children: [
                    //               _buildTransitionBlue(context,
                    //                   amount:
                    //                       '${_money!.writedMoney(e.amount)} VNĐ',
                    //                   hash: e.hash,
                    //                   type: e.type, press: () {
                    //                 Nav.nextPage(
                    //                     context: context,
                    //                     page: TransactionInfoPage(id: e.hash));
                    //               }),
                    //               SizedBox(height: 10),
                    //             ],
                    //           ))
                    //       .toList(),
                    // ),
                    SizedBox(height: 20),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
