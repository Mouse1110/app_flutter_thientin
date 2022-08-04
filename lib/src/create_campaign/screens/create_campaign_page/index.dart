import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/addtime.dart';
import 'components/censorship.dart';
import 'components/information.dart';
import 'components/settype.dart';
import 'components/topContainer.dart';

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
              TopContainer(),
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ////====================================================01: Thông tin===================================================
                      Information(),
                      SizedBox(height: 15),
                      ////====================================================02: Thời gian===================================================
                      AddTime(),
                      SizedBox(
                        height: 10,
                      ),
                      ////====================================================03: Kiểm duyệt===================================================
                      Censorship(),
                      SetType(),
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
