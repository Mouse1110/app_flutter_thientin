import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Censorship extends StatefulWidget {
  const Censorship({super.key});

  @override
  State<Censorship> createState() => _CensorshipState();
}

class _CensorshipState extends State<Censorship> {
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
                      "3",
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(242, 167, 125, 1)),
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
                              borderRadius: BorderRadius.circular(4))),
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
                              borderRadius: BorderRadius.circular(4))),
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
