import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constants/api_constant.dart';

class CampaignOutStanding extends StatelessWidget {
  final CampaignModel data;
  const CampaignOutStanding({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.network('$baseUrlImage${data.user.avatar}',
                    width: 48,
                    height: 48,
                    errorBuilder: (context, error, stackTrace) => const Icon(
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
                              color: const Color.fromRGBO(35, 45, 94, 1))),
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
          ),
          const SizedBox(
            height: 5,
          ),
          Image.network(
            '$baseUrlImage${data.image}',
            height: 300,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (context, child, error) => Center(
              child: Lottie.network(
                "https://assets4.lottiefiles.com/packages/lf20_nr3wye6b.json",
                height: 300,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
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
                  height: 10,
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
                          style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(35, 45, 94, 1),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${data.info.total} VNĐ',
                          //'${data.info.total} VND',
                          style: GoogleFonts.roboto(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hiện có ${data.listUserDonate.length} người ủng hộ chiến dịch này',
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
                            const Icon(
                              Icons.paid,
                              size: 16,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Chưa giải ngân',
                              style: GoogleFonts.roboto(
                                  color: const Color.fromRGBO(35, 45, 94, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(14, 152, 210, 1),
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
    );
  }
}
