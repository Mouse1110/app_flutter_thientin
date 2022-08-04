import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTransactionBlockChain extends StatelessWidget {
  const InfoTransactionBlockChain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border:
                  Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tổng quát',
                style: GoogleFonts.raleway(
                  color: Color.fromRGBO(35, 45, 94, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                '[ Đây là thông tin mà hệ thống ghi nhận lại, mọi người có thể kiểm tra lại bằng mã hash trên mạng Polygon ]',
                style: GoogleFonts.raleway(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTitle(
                    title: 'Mã hash:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '   data != null ? data!.hash : ' ',',
                          style: GoogleFonts.raleway(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.content_copy,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputTitle(
                    title: 'Tình trạng:',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 201, 167, 0.25),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      'Hoàn thành',
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(0, 201, 167, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputTitle(
                    title: 'Số khối:',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'blocknumber',
                    // data != null ? '${data!.blockNumber}' : '',
                    style: GoogleFonts.raleway(
                      color: Color.fromRGBO(36, 0, 255, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTitle(
                    title: 'Từ:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'data != null ? data!.from : ' ',',
                    style: GoogleFonts.raleway(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTitle(
                    title: 'Đến:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'data != null ? data!.to : ' ',',
                    style: GoogleFonts.raleway(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTitle(
                    title: 'Thời gian giao dịch:',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/wall-clock.png',
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '4/09/2022',
                        // data != null
                        //     ? 'Ngày ${DateTime.fromMillisecondsSinceEpoch(data!.date * 1000).day}, Tháng ${DateTime.fromMillisecondsSinceEpoch(data!.date * 1000).month}, Năm ${DateTime.fromMillisecondsSinceEpoch(data!.date * 1000).year}'
                        //     : '',
                        style: GoogleFonts.raleway(
                          color: Color.fromRGBO(14, 152, 210, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputTitle(
                        title: 'Số tiền: ',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 201, 167, 0.25),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '1000000',
                          // data != null
                          //     ? '${_money!.writedMoney(data!.value)} VNĐ'
                          //     // ? '${_money!.writedMoney('${data!.value}')} VNĐ'
                          //     : '',
                          style: GoogleFonts.raleway(
                            color: Color.fromRGBO(0, 201, 167, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputTitle extends StatelessWidget {
  const InputTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Circle(),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: GoogleFonts.raleway(
            color: Color.fromRGBO(35, 45, 94, 1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.24),
        shape: BoxShape.circle,
      ),
    );
  }
}
