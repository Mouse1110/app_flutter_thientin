import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCampaignPage extends StatefulWidget {
  const CreateCampaignPage({super.key});

  @override
  State<CreateCampaignPage> createState() => _CreateCampaignPageState();
}

class _CreateCampaignPageState extends State<CreateCampaignPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(88, 145, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ]),
                margin: EdgeInsets.symmetric(vertical: 24),
                //padding: EdgeInsets.symmetric(vertical: 21, horizontal: 16),
                child: Stack(
                  children: [
                    Positioned(
                        right: 52,
                        top: -23,
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 1)
                                  .withOpacity(0.25)),
                        )),
                    Positioned(
                        right: -12,
                        bottom: -11,
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 1)
                                  .withOpacity(0.25)),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 21, horizontal: 16),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.warning_outlined,
                              size: 32,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Bạn có thể khởi tạo chiến dịch mới để hỗ trợ cộng đồng",
                                style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ////====================================================01: Thông tin===================================================
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
                                          width: 2,
                                          color: Color.fromRGBO(
                                              242, 167, 125, 1))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                  child: Text(
                                    "1",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(242, 167, 125, 1)),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    BorderRadius.circular(4))),
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
                                            hintText:
                                                'Nhập nội dung chiến dịch của bạn',
                                            hintStyle: GoogleFonts.nunito(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4))),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      ////====================================================02: Thời gian===================================================
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
                                          width: 2,
                                          color: Color.fromRGBO(
                                              242, 167, 125, 1))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                  child: Text(
                                    "2",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(242, 167, 125, 1)),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Đăng ký",
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.3))),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          decoration: InputDecoration(
                                                              icon: Icon(Icons
                                                                  .calendar_month),
                                                              hintText:
                                                                  '11/10/2000',
                                                              hintStyle: GoogleFonts.nunito(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                              border:
                                                                  InputBorder
                                                                      .none),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Đóng góp",
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.3))),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          decoration: InputDecoration(
                                                              icon: Icon(Icons
                                                                  .calendar_month),
                                                              hintText:
                                                                  '11/10/2000',
                                                              hintStyle: GoogleFonts.nunito(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Kiểm duyệt",
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.3))),
                                                        child: TextFormField(
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          readOnly: true,
                                                          decoration: InputDecoration(
                                                              icon: Icon(Icons
                                                                  .calendar_month),
                                                              hintText:
                                                                  '11/10/2000',
                                                              hintStyle: GoogleFonts.nunito(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                              border:
                                                                  InputBorder
                                                                      .none),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Giải ngân",
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.3))),
                                                        child: TextFormField(
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          readOnly: true,
                                                          decoration: InputDecoration(
                                                              icon: Icon(Icons
                                                                  .calendar_month),
                                                              hintText:
                                                                  '11/10/2000',
                                                              hintStyle: GoogleFonts.nunito(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                              border:
                                                                  InputBorder
                                                                      .none),
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
                      SizedBox(
                        height: 10,
                      ),
                      ////====================================================03: Kiểm duyệt===================================================
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
                                          width: 2,
                                          color: Color.fromRGBO(
                                              242, 167, 125, 1))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                  child: Text(
                                    "3",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(242, 167, 125, 1)),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Kiểm duyệt",
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
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
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: 4,
                              height: 300,
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "| Đơn đăng ký của người thụ hưởng được duyệt hay\nkhông sẽ dựa vào các thông tin sau",
                                    style: GoogleFonts.nunito(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Column(
                                  //     children: list
                                  //         .map((e) => Item(
                                  //             phone: e.phone,
                                  //             name: e.name!,
                                  //             content: e.content,
                                  //             type: e.type,
                                  //             press: (str) {
                                  //               print(str);
                                  //               int index = list.indexWhere(
                                  //                   (element) =>
                                  //                       element.phone == str);
                                  //               if (index > -1) {
                                  //                 list.removeAt(index);
                                  //                 setState(() {});
                                  //               }
                                  //               setSize();
                                  //             }))
                                  //         .toList()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Người kiểm duyệt",
                                    style: GoogleFonts.nunito(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'Nhập số điện thoại',
                                        hintStyle: GoogleFonts.nunito(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Nội dung",
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
                                    keyboardType: TextInputType.text,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                        hintText: 'Nhập nội dung chiến dịch',
                                        hintStyle: GoogleFonts.nunito(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              alignment:
                                                  WrapAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 200,
                                                    child: DropdownButton(
                                                      isExpanded: true,
                                                      items: [
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Dạng văn bản"),
                                                          value: "txt",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Dạng hình ảnh"),
                                                          value: "img",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Dạng file pdf"),
                                                          value: "doc",
                                                        )
                                                      ],
                                                      onChanged: (value) {},
                                                      hint: Text("Chọn kiểu"),
                                                      alignment:
                                                          Alignment.center,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                InkWell(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Color.fromRGBO(
                                                              255, 206, 33, 1)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 23,
                                                              vertical: 8),
                                                      child: Text(
                                                        "Thêm mới",
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: double.infinity,
                                            child: Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              alignment:
                                                  WrapAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 2, color: Colors.blue)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 12),
                                    child: Text(
                                      "Quay lại",
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 2,
                                            color: Color.fromRGBO(
                                                88, 145, 255, 1)),
                                        color: Color.fromRGBO(88, 145, 255, 1)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 12),
                                    child: Text(
                                      "Xác nhận",
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
    ));
  }
}
