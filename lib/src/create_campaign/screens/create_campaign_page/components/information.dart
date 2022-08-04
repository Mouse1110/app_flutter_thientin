import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
                      "1",
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(242, 167, 125, 1)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Thông tin",
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
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          //height: 300,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: 4,
                  height: 280,
                  color: Color.fromRGBO(0, 0, 0, 0.15)),
              Expanded(
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "| Thông tin giúp người dùng biết bạn đang muốn kêu \ngọi vấn đề gì",
                          style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tên chiến dịch",
                          style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Nhập tên của chiến dịch',
                              hintStyle: GoogleFonts.nunito(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nội dung chiến dịch",
                          style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: 'Nhập nội dung chiến dịch của bạn',
                              hintStyle: GoogleFonts.nunito(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4))),
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
