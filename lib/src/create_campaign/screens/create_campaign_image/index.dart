import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/addimage.dart';

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
          AddImage(),
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
}
