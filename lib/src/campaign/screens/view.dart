import 'package:app_flutter_thientin/src/campaign/constants/font_constant.dart';
import 'package:app_flutter_thientin/src/campaign/screens/validation/data_validation.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/money_format.dart';
import '../constants/api_constant.dart';
import '../constants/color_constant.dart';
import 'components/item_donate.dart';
import 'components/item_show.dart';
import 'components/time_line.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key, required this.validation}) : super(key: key);
  final CampaignDataValidation validation;
  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

Widget _imageHeader(String url) => Image.network(
      url,
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
    );

Widget _info({
  required String name,
  required String wallet,
  required String receiver,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, textAlign: TextAlign.justify, style: fontTitleCenter),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ItemShowInfo(
                title: 'Số tiền hiện tại',
                info: '${MoneyFormat.formatMoney(wallet)}',
                icon: const CircleAvatar(
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
              onTap: () {},
              child: ItemShowInfo(
                title: 'Số người nhận',
                info: '$receiver người',
                icon: const CircleAvatar(
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
      ],
    );

Widget _active(BuildContext context, CampaignDataValidation validation,
        {required CampaignModel campaign}) =>
    Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/proof', arguments: campaign);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Xem minh chứng', style: fontTextButton),
                const SizedBox(
                  width: 4,
                ),
              ],
            )),
        StreamBuilder<bool>(
            stream: validation.streamButtonApprove,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return TextButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Kiểm duyệt ngay', style: fontTextButtonRed),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ));
              }
              return const SizedBox.shrink();
            }),
      ],
    );

Widget _buttonDonate(
        BuildContext context, int id, CampaignDataValidation validation) =>
    StreamBuilder<bool>(
        stream: validation.streamButtonDonate,
        builder: (context, snapshot) {
          if (snapshot.hasData & snapshot.data!) {
            return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    color: Colors.white,
                    height: 60,
                    width: double.infinity,
                    child: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/donate', arguments: id);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(14, 152, 210, 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                  child: Text(
                                'Ủng hộ',
                                style: fontButtonWhite,
                              )),
                            )))));
          }
          return const SizedBox.shrink();
        });

Widget _buttonForm(CampaignDataValidation validation) => StreamBuilder<bool>(
    stream: validation.streamButtonForm,
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data!) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                border: Border.all(
                    width: 0.5, color: Colors.black.withOpacity(0.3))),
            child: Center(child: Text('Nộp đơn ngay', style: fontButtonBlack)),
          ),
        );
      }
      return const SizedBox.shrink();
    });

Widget _listDonated(List<ListUser> users, CampaignDataValidation validation) =>
    users.length > 0
        ? Column(
            children: users
                .map((e) => ItemDonate(
                      name: e.name,
                      phone: validation.convertPhone(e.phone),
                      wallet: MoneyFormat.formatMoney(e.amount),
                    ))
                .toList(),
          )
        : const Center(
            child: Text(
              'Hiện chưa có người ủng hộ',
              style: fontBody,
            ),
          );

class _CampaignPageState extends State<CampaignPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder<CampaignModel>(
              stream: widget.validation.streamCampaign,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            _imageHeader(baseUrl + snapshot.data!.image),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  _info(
                                      name: snapshot.data!.info.name,
                                      wallet: snapshot.data!.info.total,
                                      receiver:
                                          '${snapshot.data!.listUserReceiver.length}'),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Tác vụ', style: fontTitle),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _active(
                                    context,
                                    widget.validation,
                                    campaign: snapshot.data!,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TimeLine(
                                    ticks: widget.validation
                                        .indexTimeline(snapshot.data!),
                                    date: widget.validation.timeRemaining(
                                        snapshot.data!.info.disburStart),
                                    timeLine: widget.validation
                                        .timeLine(snapshot.data!),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Nội dung chiến dịch',
                                        style: fontTitle),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ReadMoreText(
                                    snapshot.data!.info.content,
                                    textAlign: TextAlign.justify,
                                    style: fontBody,
                                    trimLines: 10,
                                    colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Xem thêm',
                                    trimExpandedText: '\nThu gọn',
                                    moreStyle: GoogleFonts.bitter(
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            14, 152, 210, 1)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buttonForm(widget.validation),

                                  ///
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Danh sách nhà hảo tâm',
                                    style: fontTitle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Danh sách sẽ được cập nhật trực tiếp',
                                    style: fontBody,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _listDonated(
                                    snapshot.data!.listUserDonate,
                                    widget.validation,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                      _buttonDonate(context, snapshot.data!.idCaimpain,
                          widget.validation),
                      Positioned(
                          left: 20,
                          top: 20,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/home');
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 24,
                                color: Colors.black,
                              ))),
                    ],
                  );
                }
                return const SizedBox.shrink();
              })),
    );
  }
}
