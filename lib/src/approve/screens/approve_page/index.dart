import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class ApprovePage extends StatefulWidget {
  const ApprovePage({super.key});

  @override
  State<ApprovePage> createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Text(
                  'Thiện Tín',
                  style: GoogleFonts.bitter(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Danh sách người đăng ký',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(39, 39, 42, 1)),
              ),
            ),
            Expanded(
                child: ContainedTabBarView(
              onChange: (i) {
                index = i;
                setState(() {});
              },
              tabs: [
                Text(
                  'Chưa kiểm duyệt',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Đã kiểm duyệt',
                  style: TextStyle(color: Colors.black),
                ),
              ],
              views: [
                itemPageCensor(context),
                itemPage(context),
              ],
            )),
            InkWell(
                child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(26, 148, 255, 1),
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                  child: Text(
                'Chấp thuận',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
              )),
            )),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }

  Widget itemPageCensor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phan Trung Giang",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(39, 39, 42, 1)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "0353274035",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(128, 128, 137, 1)),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Xem thêm',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ]),
            SizedBox(
              height: 5,
            ),
            Container(
                height: 1,
                width: double.infinity,
                color: Color.fromRGBO(128, 128, 137, 1))
          ],
        ),
      ]),
    );
  }

  Widget itemPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "Phan Trung Giang",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(39, 39, 42, 1)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "0353274035",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(128, 128, 137, 1)),
                  )
                ],
              ),
            ]),
            SizedBox(height: 8),
            Container(
                height: 1,
                width: double.infinity,
                color: Color.fromRGBO(128, 128, 137, 1))
          ],
        ),
      ]),
    );
  }
}
