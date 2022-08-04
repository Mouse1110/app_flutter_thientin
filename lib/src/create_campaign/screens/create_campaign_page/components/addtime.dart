import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTime extends StatefulWidget {
  const AddTime({super.key});

  @override
  State<AddTime> createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(242, 167, 125, 1))),
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                    child: Text(
                      "2",
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(242, 167, 125, 1)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Thời gian",
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(242, 167, 125, 1)),
                child: Text(
                  "Đang thực hiện",
                  style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          //height: 300,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: 4,
                  height: 200,
                  color: Color.fromRGBO(0, 0, 0, 0.15)),
              Expanded(
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "| Tạo các mốc thời gian để",
                          style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Đăng ký",
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          padding: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.3))),
                                          child: TextFormField(
                                            readOnly: true,
                                            style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            decoration: InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                hintText: '11/10/2000',
                                                hintStyle: GoogleFonts.nunito(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Đóng góp",
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.3))),
                                          child: TextFormField(
                                            readOnly: true,
                                            style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            decoration: InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                hintText: '11/10/2000',
                                                hintStyle: GoogleFonts.nunito(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kiểm duyệt",
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          padding: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.3))),
                                          child: TextFormField(
                                            style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                hintText: '11/10/2000',
                                                hintStyle: GoogleFonts.nunito(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Giải ngân",
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          padding: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.3))),
                                          child: TextFormField(
                                            style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                hintText: '11/10/2000',
                                                hintStyle: GoogleFonts.nunito(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
