import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import 'components/time_line.dart';

class Campaign_page extends StatefulWidget {
  const Campaign_page({Key? key}) : super(key: key);

  @override
  State<Campaign_page> createState() => _Campaign_pageState();
}

int checkMoney = 0;
bool state = false;
int ticks = 0;


 

Widget line() {
  return Container(
    color: Colors.blue,
    height: 5.0,
    width: 30,
  );
}

bool checkButton = true;

class _Campaign_pageState extends State<Campaign_page> {
  static const colortheme = const Color(0xfff2f4ff);
  static const colorsbutton1 = const Color(0xff5f68eb);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Scaffold(
          body:  Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            'https://pystravel.vn/uploads/posts/albums/2985/1fd41344d1a3df618a2e60a04728da94.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            // errorBuilder: (context, error, stackTrace) =>
                            //     Image.file(
                            //   pathImageReview!,
                            //   height: MediaQuery.of(context).size.height / 2,
                            //   width: double.infinity,
                            //   fit: BoxFit.contain,
                            //   errorBuilder: (context, error, stackTrace) =>
                            //       Container(
                            //           height:
                            //               MediaQuery.of(context).size.height /
                            //                   2,
                            //           width: double.infinity,
                            //           color: Colors.white),
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dữ liệu 1',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.raleway(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ItemShowInfo(
                                        title: 'Số tiền hiện tại',
                                        info:
                                            ' dữ liệu tiền VNĐ',
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.yellow,
                                          radius: 14,
                                          child: ClipOval(
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
              
                                      },
                                      child: ItemShowInfo(
                                        title: 'Số người nhận',
                                        info:
                                            'dữ liệu 3' +
                                                ' người',
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 14,
                                          child: ClipOval(
                                            child: Icon(
                                              Icons.person_add,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                   
                                  ],
                                ),
                                Divider(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Tác vụ',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ),
                                TextButton(
                                    onPressed: () {
                                     
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Xem minh chứng',
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                color: Color.fromRGBO(
                                                    26, 148, 255, 1))),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        
                                      ],
                                    )),
                                TextButton(
                                    onPressed: () {
                                   
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Xem danh sách người nhận',
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                color: Color.fromRGBO(
                                                    26, 148, 255, 1))),
                                        SizedBox(
                                          width: 4,
                                        ),
                                       
                                      ],
                                    )),
                                
                                  TextButton(
                                      onPressed: () {
                                         
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Giải ngân ngay',
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color: Colors.red)),
                                          SizedBox(
                                            width: 4,
                                          ),
                                         
                                        ],
                                      )),
                                            Divider(),
                                             SizedBox(
                    height: 10,
                  ),
                                      timeline(),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                               
                                Divider(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Nội dung chiến dịch',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ReadMoreText(
                                 'data',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.raleway(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                  trimLines: 10,
                                  colorClickableText: Colors.blue,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Xem thêm',
                                  trimExpandedText: '\n' + 'Thu gọn',
                                  moreStyle: GoogleFonts.bitter(
                                      fontSize: 14,
                                      color: Color.fromRGBO(14, 152, 210, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                     
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: colorsbutton1,
                                    ),
                                    child: Center(
                                        child: Text('Nộp đơn ngay',
                                            style: GoogleFonts.raleway(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white))),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Danh sách nhà hảo tâm',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // ItemPage(
                                //   list: widget.data.listUserDonate,
                                // ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                color: Colors.white,
                                height: 60,
                                width: double.infinity,
                                child: Container(
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child:  InkWell(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  14, 152, 210, 1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Ủng hộ',
                                              style: GoogleFonts.bitter(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            )),
                                       )))       )),
          ])
                                       
                    
                    
        );
 
  }
}

class ItemShowInfo extends StatelessWidget {
  final Widget icon;
  final String title;
  final String info;
  const ItemShowInfo({
    Key? key,
    required this.icon,
    required this.info,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                info,
                style: GoogleFonts.readexPro(fontSize: 12, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 
 
