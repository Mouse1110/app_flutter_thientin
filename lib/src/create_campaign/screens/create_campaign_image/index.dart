import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CampaignImagePage extends StatefulWidget {
  const CampaignImagePage({super.key});

  @override
  State<CampaignImagePage> createState() => _CampaignImagePageState();
}

class _CampaignImagePageState extends State<CampaignImagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(children: [
          Text(
            'DANH SÁCH HÌNH ẢNH',
            style: GoogleFonts.raleway(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(height: 10),
          Divider(
            height: 5,
            color: Colors.grey,
            thickness: 2,
          ),
          _addImage(),
          SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Bạn hãy kiểm tra lại trước khi gửi',
                      style: GoogleFonts.raleway(
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color.fromRGBO(14, 152, 210, 1)),
                      child: Center(
                        child: Text('Xác nhận',
                            style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                    ),
                  )
                ]),
          ),
          SizedBox(height: 12)
        ]),
      )),
    );
  }

  Widget _addImage() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey.withOpacity(0.25),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Column(
              //   children: list
              //       .map((e) => Item(
              //           image: e,
              //           press: (str) {
              //             print(str);
              //             int index = list.indexWhere(
              //                 (element) => element.path == str);
              //             if (index > -1) {
              //               list.removeAt(index);
              //               setState(() {});
              //             }
              //           }))
              //       .toList(),
              // ),
              SizedBox(height: 16),
              InkWell(
                child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text(
                        'Thêm mới',
                        style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
