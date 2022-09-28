import 'package:app_flutter_thientin/src/home/constants/color_constant.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/money_format.dart';
import '../../constants/api_constant.dart';

class ItemCampain extends StatelessWidget {
  final CampaignModel data;
  final Function onClick;
  const ItemCampain({
    Key? key,
    required this.onClick,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                '$baseUrlImage${data.image}',
                height: 250,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, child, error) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const RadialGradient(
                      radius: 1,
                      colors: [
                        Colors.white,
                        Color.fromRGBO(109, 213, 250, 1),
                      ],
                    ),
                  ),
                  child: Lottie.network(
                    "https://assets6.lottiefiles.com/packages/lf20_zi361grc.json",
                    height: 250,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network('$baseUrlImage${data.user.avatar}',
                              width: 48,
                              height: 48,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.account_circle,
                                    size: 48,
                                  )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.user.name,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            35, 45, 94, 1))),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(data.user.phone,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.info.name,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(35, 45, 94, 1)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Hiện có ${data.listUserDonate.length} người ủng hộ chiến dịch này',
                            style: GoogleFonts.roboto(
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đạt được: ',
                            style: GoogleFonts.roboto(
                                color: const Color.fromRGBO(35, 45, 94, 1),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            MoneyFormat.formatMoney(data.info.total),
                            style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.paid,
                            size: 16,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            !data.info.isDisbur
                                ? 'Chưa giải ngân'
                                : 'Đã giải ngân',
                            style: GoogleFonts.roboto(
                                color: const Color.fromRGBO(35, 45, 94, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            onClick();
                          },
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: backgroundButton,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'Xem thêm',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
