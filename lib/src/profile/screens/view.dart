import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Cá Nhân',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            elevation: 0,
            backgroundColor: const Color.fromRGBO(88, 145, 255, 1),
          ),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Thông tin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromRGBO(151, 163, 182, 1)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        )),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.person),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Nguyễn Long Bá',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_right),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        )),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.person),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Nguyễn Long Bá'),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  bug(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: BoxConstraints(maxHeight: 350),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 40,
                      ),
                      Text('Tính năng hiện đang cập nhật',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center),
                    ],
                  )),
            ),
          );
        });
  }

  out(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 4),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text('Đăng xuất',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black)))),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      'Bạn muốn quay lại trang đăng nhập ?',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Quay lại',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Đăng xuất',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
