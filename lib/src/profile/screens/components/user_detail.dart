import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetail extends StatefulWidget {

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

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
                       'Mach Tan Tai',
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
                                                
                                                      Text(
                                                          'Tải hình ảnh lên',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromRGBO(
                                                                    35,
                                                                    45,
                                                                    94,
                                                                    1),
                                                          ),
                                                        ),
                                                    
                                                  SizedBox(width: 20),
                                                  InkWell(
                                                    onTap: () async {
                                                     
                                                    },
                                                    // => pickImage(
                                                    //     ImageSource.gallery),
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
                                                          'Chọn file',
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
                                                  RaisedButton(
                                                    onPressed: () {
                                                      
                                                    },
                                                    color: Colors.green,
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
