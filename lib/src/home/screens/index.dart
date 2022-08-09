import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/color_constant.dart';
import 'components/button_event.dart';
import 'components/campain_new_page.dart';
import 'components/float_button.dart';
import 'components/itemCampain_page.dart';
import 'components/title_another.dart';
import 'components/title_header.dart';
import 'validations/data_validation.dart';

class HomePage extends StatefulWidget {
  final DataValidation validation;
  const HomePage({Key? key, required this.validation}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _header() => StreamBuilder<Object>(
      stream: widget.validation.streamCampaign,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              const TitleHeader(),
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    '${snapshot.error}',
                    style:
                        GoogleFonts.roboto(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        }
        if (snapshot.hasData) {
          return Column(
            children: [
              const TitleHeader(),
              CampaignOutStanding(
                data: snapshot.data as CampaignModel,
              ),
            ],
          );
        }
        return const ShimmerHeader();
      });

  Widget _still() => StreamBuilder<Object>(
      stream: widget.validation.streamListCampaign,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (snapshot.data as List).length,
              itemBuilder: ((context, index) => Column(
                    children: [
                      const SizedBox(height: 20),
                      ItemCampain(
                        data: (snapshot.data as List)[index],
                      ),
                      const Divider(
                        color: fontColor,
                      ),
                    ],
                  )));
        }
        return const ShimmerBody();
      });

  Widget _eventCampaign() => StreamBuilder<Object>(
      stream: widget.validation.streamListCampaign,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const TitlteAnother(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    ButtonEvent(
                      text: 'Đang hoạt động',
                      press: () {},
                      init: true,
                    ),
                    const SizedBox(width: 20),
                    ButtonEvent(
                      text: 'Đã kết thúc',
                      press: () {},
                      init: false,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _header(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: fontColor,
              ),
              const SizedBox(height: 10),
              _eventCampaign(),
              const SizedBox(height: 10),
              _still(),
              const SizedBox(height: 60),
            ],
          ),
        ),
        floatingActionButton: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FloatButton(
                  press: () {},
                );
              }
              return const SizedBox();
            }),
      ),
    );
  }
}

class ShimmerBody extends StatelessWidget {
  const ShimmerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.3),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: ((context, index) => Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: fontColor,
                    ),
                  ],
                ))));
  }
}

class ShimmerHeader extends StatelessWidget {
  const ShimmerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.3),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
