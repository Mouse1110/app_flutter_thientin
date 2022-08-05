import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  String imagePath = '';
  File? image;
  File? name;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      print(image!.path);

      if (image == null) return;
      final imageTemporary = File(image.path);
      imagePath = image.path;
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/icon.png',
                  // 'assets/user.png',
                  height: 60.0,
                  width: 60.0,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (
                                BuildContext context,
                              ) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter mystate) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxHeight: 350),
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Chỉnh sửa thông tin cá nhân',
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: TextFormField(
                                                  onChanged: (value) {},
                                                  decoration: InputDecoration(
                                                      hintText: '',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: image == null
                                                        ? Text(
                                                            'Tải hình ảnh lên',
                                                            style: GoogleFonts
                                                                .raleway(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      35,
                                                                      45,
                                                                      94,
                                                                      1),
                                                            ),
                                                          )
                                                        : Image.file(
                                                            image!,
                                                            height: 128,
                                                            width: 128,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        final image =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery);
                                                        print(image!.path);

                                                        if (image == null)
                                                          return;
                                                        final imageTemporary =
                                                            File(image.path);
                                                        imagePath = image.path;
                                                        mystate(() =>
                                                            this.image =
                                                                imageTemporary);
                                                      } on PlatformException catch (e) {
                                                        print('Fail');
                                                      }
                                                    },
                                                    // =>
                                                    //   pickImage(
                                                    //       ImageSource.gallery),

                                                    child: Container(
                                                      height: 50,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: Row(children: [
                                                        Icon(
                                                            Icons
                                                                .file_upload_outlined,
                                                            color:
                                                                Colors.white),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          'Chọn ảnh',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("CANCEL",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            letterSpacing: 2.2,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                    child: Text(
                                                      "SAVE",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          letterSpacing: 2.2,
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  );
                                });
                              });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'KHÁCH HÀNG',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.3)),
                  )
                ],
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Quay lại',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ))
        ],
      ),
    );
  }
}
