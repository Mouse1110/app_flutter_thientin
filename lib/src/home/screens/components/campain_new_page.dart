import 'package:app_flutter_thientin/src/home/constants/api_constant.dart';
import 'package:app_flutter_thientin/src/home/index.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCampainnew extends StatelessWidget {
  ItemCampainnew({Key? key, required this.campaign,}) : super(key: key);
  final CampaignModel campaign;
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipOval(
                            child: Image.network(
                              // '${urlImage}${data.avatar}.png',
                              'https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png',
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset("assets/user.png"),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(campaign.user.name,
                                style: GoogleFonts.raleway(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 355
                                            ? 14
                                            : 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(35, 45, 94, 1)
                                        .withOpacity(0.5))),
                            Text(
                              DateTime.now()
                                              .difference(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      campaign.info.regStart *
                                                          1000))
                                              .inDays +
                                          1 ==
                                      0
                                  ? "Hôm nay"
                                  : '${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(campaign.info.regStart * 1000)).inDays} ngày trước',
                           style: GoogleFonts.raleway(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 355
                                            ? 14
                                            : 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.3))
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Image.network(
           urlImage+campaign.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (context, child, error) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.grey),
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/Charity.png',
                fit: BoxFit.contain,
                height: 300,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        campaign.info.name,
                        style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(35, 45, 94, 1)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Đạt được: ',
                                style: GoogleFonts.raleway(
                                    color: Color.fromRGBO(35, 45, 94, 1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                campaign.info.total+" VND",
                                //'${data.info.total} VND',
                                style: GoogleFonts.roboto(
                                    color: Colors.red,
                                    fontSize:
                                        MediaQuery.of(context).size.width > 355
                                            ? 14
                                            : 10,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Hiện có ${campaign.countDonate} người ủng hộ chiến dịch này',
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.network(
                                      'http://store-images.s-microsoft.com/image/apps.9248.13782831719857255.28521e9e-6061-477d-a61c-0d635828fa49.94b424cc-bfed-4d01-a37d-db8287d72586',
                                      height: 12,
                                      width: 12),
                                  SizedBox(width: 5),
                                  Text(
                                     DateTime.fromMillisecondsSinceEpoch(
                                                        campaign.info.disburStart *
                                                            1000)
                                                    .difference(DateTime.now())
                                                    .inDays +
                                                1 >
                                            0
                                        ? 'Còn lại ${DateTime.fromMillisecondsSinceEpoch(campaign.info.disburStart * 1000).difference(DateTime.now()).inDays + 1} ngày'
                                        : 'Đã kết thúc',
                                    style: GoogleFonts.raleway(
                                        color: Color.fromRGBO(35, 45, 94, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
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
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
