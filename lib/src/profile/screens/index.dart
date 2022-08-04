import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/info.dto.dart';
import 'components/info_detail.dart';
import 'components/item_action.dart';
import 'components/user_detail.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    list_info_item = [
      InfoItem(
          icon: Icons.notifications_active,
          press: () {
            bug(context);
          },
          title: 'Thông báo'),
      InfoItem(
          icon: Icons.add,
          press: () {
            bug(context);
          },
          title: 'Nạp tiền'),
      InfoItem(icon: Icons.assignment_ind, press: () {}, title: 'Chuyển tiền'),
      InfoItem(
          icon: Icons.book,
          press: () {
            bug(context);
          },
          title: 'Liên kết ví'),
      InfoItem(
          icon: Icons.arrow_back,
          press: () {
            out(context);
          },
          title: 'Đăng xuất'),
    ];

    // _user = UserControllerr();
    // _user!.postUser2().then((value) {
    //   if (value != null) {
    //     registerOTD = value;
    //     setState(() {});
    //   }
    // });
  }

  static const colortheme = Color.fromRGBO(245, 245, 245, 1);
  List<InfoItem> list_info_item = [];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colortheme,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: Column(
              children: [
                UserDetail(),
                const SizedBox(
                  height: 4,
                ),
                InfoDetail(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.do_disturb_on,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          'Chú ý ! Vui lòng liên kết với tài hoản ngân hàng để có thể thực hiện một số tính năng của ứng dụng',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          textAlign: TextAlign.justify,
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: list_info_item
                            .map(
                              (e) => ItemAction(
                                  icon: e.icon, title: e.title, press: e.press),
                            )
                            .toList()),
                  ),
                ),
              ],
            ),
          ),
        ));
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
