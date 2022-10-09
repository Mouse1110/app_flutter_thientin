import 'dart:io';

import 'package:app_flutter_thientin/src/create_campaign/screens/validations/form_validation.dart';
import 'package:app_flutter_thientin/src/utils/image_picker.dart';
import 'package:app_flutter_thientin/src/utils/popup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateCampaignImagePage extends StatefulWidget {
  const CreateCampaignImagePage({super.key, required this.validation});
  final CreateCampaignFormValidation validation;
  @override
  State<CreateCampaignImagePage> createState() =>
      _CreateCampaignImagePageState();
}

class _CreateCampaignImagePageState extends State<CreateCampaignImagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(children: [
          const Text(
            'Danh Sách Hình Ảnh',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(height: 20),
          _addImage(widget.validation),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Bạn hãy kiểm tra lại trước khi gửi',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  StreamBuilder<Object>(
                      stream: widget.validation.streamImage,
                      builder: (context, snapshot) {
                        return Expanded(
                          child: ElevatedButton(
                            onPressed: snapshot.hasData
                                ? () {
                                    Popup.show(context,
                                        title: "Thông báo",
                                        body:
                                            "Bạn thật sự mong muốn khởi tạo chiến dịch mới này ?",
                                        accept: () {});
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(88, 145, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 23, vertical: 12),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Xác nhận",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        );
                      })
                ]),
          ),
          const SizedBox(height: 12)
        ]),
      )),
    );
  }

  Widget _addImage(CreateCampaignFormValidation validation) {
    return StreamBuilder<XFile>(
        stream: validation.streamImage,
        builder: (context, snapshot) {
          return Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey.withOpacity(0.25),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (snapshot.hasData) Image.file(File(snapshot.data!.path)),
                    const SizedBox(height: 16),
                    if (!snapshot.hasData)
                      InkWell(
                        onTap: () async {
                          XFile? image = await ImagePickerCustom.pickImage();
                          if (image != null) validation.addImage(image);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
