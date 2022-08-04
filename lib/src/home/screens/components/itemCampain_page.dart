import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  

class ItemCampain extends StatelessWidget {
  ItemCampain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                    errorBuilder: (context, child, error) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey),
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 48,
                                          width: 48,
                                          child: ClipOval(
                                            child: Image.network(
                                              // '${urlImage}${data.avatar}.png',
                                              'https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png',
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.network(
                                                      "assets/user.png"),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('bÙI XUÂN CẢNH 3 ',
                                                style: GoogleFonts.raleway(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width >
                                                                355
                                                            ? 14
                                                            : 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                            35, 45, 94, 1)
                                                        .withOpacity(0.5))),
                                            Text('20/12/2022'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'bui xuan canh 4',
                                      style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(35, 45, 94, 1)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Hiện có 5 người ủng hộ chiến dịch này',
                                      style: GoogleFonts.roboto(
                                        fontSize: 10,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Đạt được: ',
                                          style: GoogleFonts.raleway(
                                              color:
                                                  Color.fromRGBO(35, 45, 94, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          ' 2222 VNĐ',

                                          //'${data.info.total} VND',
                                          style: GoogleFonts.roboto(
                                              color: Colors.red,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      355
                                                  ? 12
                                                  : 10,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.network(
                                            'http://store-images.s-microsoft.com/image/apps.9248.13782831719857255.28521e9e-6061-477d-a61c-0d635828fa49.94b424cc-bfed-4d01-a37d-db8287d72586',
                                            height: 12,
                                            width: 12),
                                        SizedBox(width: 5),
                                        Text(
                                          '200.00',
                                          style: GoogleFonts.raleway(
                                              color:
                                                  Color.fromRGBO(35, 45, 94, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(14, 152, 210, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  'Ủng hộ',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
