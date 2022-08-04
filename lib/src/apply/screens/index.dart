import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApplyPage extends StatefulWidget {
  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Text("Thông tin của bạn",
                      style: GoogleFonts.bitter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Container(
                    height: 30,
                    width: 30,
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 23),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(
                          5,
                          5,
                        ),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'dasdasdsa',
                          // '${listCheckbox[value]}',
                          style: GoogleFonts.bitter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // _buildChild(widget.outStandingOtd.checkList[init].type),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 32,
                              width: 32,
                              color: Color.fromRGBO(255, 93, 93, 1),
                              child: Icon(
                                Icons.east,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(height: 50),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(width: 10),
                        Text('dasdsad',
                            style: GoogleFonts.bitter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    );
                  },
                ))
              ],
            )),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hoàn Thành',
                      style: GoogleFonts.bitter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
