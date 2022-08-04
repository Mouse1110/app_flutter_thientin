import 'package:app_flutter_thientin/src/home/screens/index.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/campain_new_page.dart';
import 'components/itemCampain_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool change = true;
bool is360 = true;
bool checkButton = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Chiến dịch nổi bật',
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(35, 45, 94, 1))),
                  ),
                  ItemCampainnew(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Chiến dịch khác',
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(35, 45, 94, 1))),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              change = true;
                              checkButton = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(14, 152, 210, 1)),
                              color: checkButton
                                  ? Color.fromRGBO(14, 152, 210, 1)
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Đang hoạt động',
                                style: GoogleFonts.raleway(
                                    color: checkButton
                                        ? Colors.white
                                        : Color.fromRGBO(14, 152, 210, 1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              change = false;
                              checkButton = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(14, 152, 210, 1)),
                              color: checkButton
                                  ? Colors.white
                                  : Color.fromRGBO(14, 152, 210, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Đã kết thúc',
                                style: GoogleFonts.raleway(
                                    color: checkButton
                                        ? Color.fromRGBO(14, 152, 210, 1)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  change ? still() : over(),
                  SizedBox(height: 60),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('THIỆN TÍN',
                          style: GoogleFonts.raleway(
                              color: Colors.blue,
                              fontSize: is360 ? 20 : 16,
                              fontWeight: FontWeight.w800)),
                      InkWell(
                        onTap: () {},
                        child: Row(children: [
                          Text(
                            //  totalWallet,
                            ' 200 VNĐ',
                            style: GoogleFonts.roboto(
                              color: Color.fromRGBO(35, 45, 94, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.person_rounded,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ]),
                      )
                    ]),
              ),
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(14, 152, 210, 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month_outlined,
                                    color: Colors.white),
                                SizedBox(width: 20),
                                Text('Khởi tạo chiến dịch',
                                    style: GoogleFonts.raleway(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget still() {
    return Column(
      children: [
        SizedBox(height: 20),
        ItemCampain(),
      ],
    );
  }

  Widget over() {
    print('Đã kết thúc');

    return Column(
      children: [
        SizedBox(height: 20),
        ItemCampain(),
      ],
    );
  }
}
