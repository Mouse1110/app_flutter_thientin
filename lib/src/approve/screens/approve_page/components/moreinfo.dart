import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInfo extends StatefulWidget {
  MoreInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Giang nè",
                        style: GoogleFonts.bitter(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Tiêu chí',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Color.fromRGBO(128, 128, 137, 1)
                              .withOpacity(0.25)),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "A Bá có đẹp trai không",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Color.fromRGBO(128, 128, 137, 1)
                                          .withOpacity(0.25)),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content:
                                                    Image.asset('icon.png'),
                                                title: Center(
                                                  child: Text(
                                                    "A Bá xấu",
                                                    style: GoogleFonts.inder(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Thoát ra',
                                                      style: GoogleFonts.inder(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Text('Xem minh chứng')),
                                  Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Color.fromRGBO(128, 128, 137, 1)
                                          .withOpacity(0.25)),
                                  SizedBox(height: 20),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(26, 148, 255, 1)),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        'Huỷ bỏ',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color.fromRGBO(26, 148, 255, 1)),
                      )),
                    ),
                  )),
                  SizedBox(width: 30),
                  Expanded(
                      child: InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(26, 148, 255, 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        'Chấp thuận',
                        style: GoogleFonts.inter(
                            fontSize: 14, color: Colors.white),
                      )),
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
