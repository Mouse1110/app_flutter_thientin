import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetType extends StatefulWidget {
  const SetType({super.key});

  @override
  State<SetType> createState() => _SetTypeState();
}

class _SetTypeState extends State<SetType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kiểu",
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
                              width: double.infinity,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 200,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Dạng văn bản"),
                                            value: "txt",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Dạng hình ảnh"),
                                            value: "img",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Dạng file pdf"),
                                            value: "doc",
                                          )
                                        ],
                                        onChanged: (value) {},
                                        hint: Text("Chọn kiểu"),
                                        alignment: Alignment.center,
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  InkWell(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromRGBO(
                                                255, 206, 33, 1)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 23, vertical: 8),
                                        child: Text(
                                          "Thêm mới",
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    width: 200,
                                    child: SizedBox(),
                                  ),
                                  SizedBox(width: 30),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
