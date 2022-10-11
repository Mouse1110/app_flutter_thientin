import 'package:app_flutter_thientin/src/components/flash_message_component.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/time_picker.dart';
import '../../cubit/create_campaign_cubit.dart';
import '../../models/campaign_models.dart';
import '../validations/form_validation.dart';
import 'components/topContainer.dart';

class CreateCampaignPage extends StatefulWidget {
  const CreateCampaignPage({super.key, required this.validation});
  final CreateCampaignFormValidation validation;
  @override
  State<CreateCampaignPage> createState() => _CreateCampaignPageState();
}

class _CreateCampaignPageState extends State<CreateCampaignPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed('/home');
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TopContainer(),
                Expanded(
                    child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ////====================================================01: Thông tin===================================================
                        _information(widget.validation),
                        const SizedBox(height: 15),
                        ////====================================================02: Thời gian===================================================
                        _addTime(context, widget.validation),
                        const SizedBox(
                          height: 10,
                        ),
                        ////====================================================03: Kiểm duyệt===================================================
                        _censorship(widget.validation),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    RouteNavigator.pushName(context, '/home');
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 2, color: Colors.blue)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 23, vertical: 12),
                                      child: const Text(
                                        "Quay lại",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              StreamBuilder<bool>(
                                  stream: widget.validation.streamButtonFinish,
                                  builder: (context, snapshot) {
                                    return Expanded(
                                      child: ElevatedButton(
                                        onPressed: !snapshot.hasData
                                            ? null
                                            : () {
                                                context
                                                    .read<CreateCampaignCubit>()
                                                    .changePage(1);
                                              },
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color.fromRGBO(
                                              88, 145, 255, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 23, vertical: 12),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Xác nhận",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )),
      )),
    );
  }

  Widget _information(CreateCampaignFormValidation validation) {
    return StreamBuilder<bool>(
        stream: validation.streamValidateContent,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 2,
                                  color: !snapshot.hasData
                                      ? const Color.fromRGBO(242, 167, 125, 1)
                                      : const Color.fromRGBO(88, 145, 255, 1))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: !snapshot.hasData
                                    ? const Color.fromRGBO(242, 167, 125, 1)
                                    : const Color.fromRGBO(88, 145, 255, 1)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Thông tin",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: !snapshot.hasData
                              ? const Color.fromRGBO(242, 167, 125, 1)
                              : const Color.fromRGBO(88, 145, 255, 1)),
                      child: Text(
                        !snapshot.hasData ? "Đang thực hiện" : "Hoàn thành",
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 4,
                      height: 240,
                      color: !snapshot.hasData
                          ? const Color.fromRGBO(0, 0, 0, 0.15)
                          : const Color.fromRGBO(88, 145, 255, 1)),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "| Thông tin giúp người dùng biết bạn đang muốn kêu \ngọi vấn đề gì",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Tên chiến dịch",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            StreamBuilder<String>(
                                stream: widget.validation.streamName,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    onChanged: validation.addName,
                                    decoration: InputDecoration(
                                        hintText: 'Nhập tên của chiến dịch',
                                        errorText: snapshot.hasError
                                            ? '${snapshot.error}'
                                            : null,
                                        hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  );
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Nội dung chiến dịch",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            StreamBuilder<String>(
                                stream: validation.streamContent,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    maxLines: 4,
                                    onChanged: validation.addContent,
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError
                                            ? '${snapshot.error}'
                                            : null,
                                        hintText:
                                            'Nhập nội dung chiến dịch của bạn',
                                        hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  );
                                }),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  Widget _addTime(
      BuildContext context, CreateCampaignFormValidation validation) {
    return StreamBuilder<bool>(
        stream: validation.streamTime,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 2,
                                  color: !snapshot.hasData
                                      ? const Color.fromRGBO(242, 167, 125, 1)
                                      : const Color.fromRGBO(88, 145, 255, 1))),
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                          child: Text(
                            "2",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: !snapshot.hasData
                                    ? const Color.fromRGBO(242, 167, 125, 1)
                                    : const Color.fromRGBO(88, 145, 255, 1)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Thời gian",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: !snapshot.hasData
                              ? const Color.fromRGBO(242, 167, 125, 1)
                              : const Color.fromRGBO(88, 145, 255, 1)),
                      child: Text(
                        !snapshot.hasData ? 'Đang thực hiện' : 'Hoàn thành',
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 4,
                      height: 200,
                      color: !snapshot.hasData
                          ? const Color.fromRGBO(0, 0, 0, 0.15)
                          : const Color.fromRGBO(88, 145, 255, 1)),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "| Tạo các mốc thời gian để",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Đăng ký",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 5),
                                            StreamBuilder<String>(
                                                stream:
                                                    validation.streamTimeForm,
                                                builder: (context, snapshot) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            width: 2,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.3))),
                                                    child: TextFormField(
                                                      readOnly: true,
                                                      controller:
                                                          TextEditingController()
                                                            ..text = snapshot
                                                                    .hasData
                                                                ? snapshot.data!
                                                                : '',
                                                      onTap: () async {
                                                        DateTime? date =
                                                            await TimePicker.pick(
                                                                context,
                                                                initial:
                                                                    DateTime
                                                                        .now(),
                                                                first: DateTime
                                                                    .now(),
                                                                last: DateTime(
                                                                    2050));
                                                        if (date != null) {
                                                          validation
                                                              .addTimeForm(date
                                                                  .millisecondsSinceEpoch);
                                                        }
                                                      },
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      decoration: const InputDecoration(
                                                          icon: Icon(Icons
                                                              .calendar_month),
                                                          hintText: 'Thời gian',
                                                          hintStyle: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                          border:
                                                              InputBorder.none),
                                                    ),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Đóng góp",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            StreamBuilder<String>(
                                                stream:
                                                    validation.streamTimeDonate,
                                                builder: (context, snapshot) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            width: 2,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.3))),
                                                    child: TextFormField(
                                                      readOnly: true,
                                                      onTap: () async {
                                                        if (!validation.timeForm
                                                            .hasValue) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  FlashMessage.popup(
                                                                      'Thông báo',
                                                                      'Bạn chưa chọn thời gian Đăng ký'));
                                                          return;
                                                        }
                                                        DateTime first = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                validation
                                                                    .timeForm
                                                                    .value);
                                                        DateTime? date =
                                                            await TimePicker.pick(
                                                                context,
                                                                initial: first,
                                                                first: first,
                                                                last: DateTime(
                                                                    2050));
                                                        if (date != null) {
                                                          validation
                                                              .addTimeDonate(date
                                                                  .millisecondsSinceEpoch);
                                                        }
                                                      },
                                                      controller:
                                                          TextEditingController()
                                                            ..text = snapshot
                                                                    .hasData
                                                                ? snapshot.data!
                                                                : '',
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      decoration: const InputDecoration(
                                                          icon: Icon(Icons
                                                              .calendar_month),
                                                          hintText: 'Thời gian',
                                                          hintStyle: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                          border:
                                                              InputBorder.none),
                                                    ),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Kiểm duyệt",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 5),
                                            StreamBuilder<String>(
                                                stream: widget.validation
                                                    .streamTimeApprove,
                                                builder: (context, snapshot) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            width: 2,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.3))),
                                                    child: TextFormField(
                                                      onTap: () async {
                                                        if (!validation
                                                            .timeDonate
                                                            .hasValue) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  FlashMessage.popup(
                                                                      'Thông báo',
                                                                      'Bạn chưa chọn thời gian Đóng góp'));
                                                          return;
                                                        }
                                                        DateTime first = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                validation
                                                                    .timeDonate
                                                                    .value);
                                                        DateTime? date =
                                                            await TimePicker.pick(
                                                                context,
                                                                initial: first,
                                                                first: first,
                                                                last: DateTime(
                                                                    2050));
                                                        if (date != null) {
                                                          validation
                                                              .addTimeAprrove(date
                                                                  .millisecondsSinceEpoch);
                                                        }
                                                      },
                                                      controller:
                                                          TextEditingController()
                                                            ..text = snapshot
                                                                    .hasData
                                                                ? snapshot.data!
                                                                : '',
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      readOnly: true,
                                                      decoration: const InputDecoration(
                                                          icon: Icon(Icons
                                                              .calendar_month),
                                                          hintText: 'Thời gian',
                                                          hintStyle: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                          border:
                                                              InputBorder.none),
                                                    ),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Giải ngân",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 5),
                                            StreamBuilder<String>(
                                                stream:
                                                    validation.streamTimeDisbur,
                                                builder: (context, snapshot) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                        left: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            width: 2,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.3))),
                                                    child: TextFormField(
                                                      onTap: () async {
                                                        if (!validation
                                                            .timeApprove
                                                            .hasValue) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  FlashMessage.popup(
                                                                      'Thông báo',
                                                                      'Bạn chưa chọn thời gian Kiểm duyệt'));
                                                          return;
                                                        }
                                                        DateTime first = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                validation
                                                                        .timeApprove
                                                                        .value +
                                                                    24 *
                                                                        60 *
                                                                        60 *
                                                                        1000);
                                                        DateTime? date =
                                                            await TimePicker.pick(
                                                                context,
                                                                initial: first,
                                                                first: first,
                                                                last: DateTime(
                                                                    2050));
                                                        if (date != null) {
                                                          validation
                                                              .addTimeDisbur(date
                                                                  .millisecondsSinceEpoch);
                                                        }
                                                      },
                                                      controller:
                                                          TextEditingController()
                                                            ..text = snapshot
                                                                    .hasData
                                                                ? snapshot.data!
                                                                : '',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      readOnly: true,
                                                      decoration: const InputDecoration(
                                                          icon: Icon(Icons
                                                              .calendar_month),
                                                          hintText: 'Chọn ngày',
                                                          hintStyle: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                          border:
                                                              InputBorder.none),
                                                    ),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  Widget _censorship(CreateCampaignFormValidation validation) {
    return StreamBuilder<bool>(
        stream: validation.streamApporve,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 2,
                                  color: !snapshot.hasData
                                      ? const Color.fromRGBO(242, 167, 125, 1)
                                      : const Color.fromRGBO(88, 145, 255, 1))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          child: Text(
                            "3",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: !snapshot.hasData
                                    ? const Color.fromRGBO(242, 167, 125, 1)
                                    : const Color.fromRGBO(88, 145, 255, 1)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Kiểm duyệt",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: !snapshot.hasData
                              ? const Color.fromRGBO(242, 167, 125, 1)
                              : const Color.fromRGBO(88, 145, 255, 1)),
                      child: Text(
                        !snapshot.hasData ? "Đang thực hiện" : "Hoàn thành",
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "| Đơn đăng ký của người thụ hưởng được duyệt hay\nkhông sẽ dựa vào các thông tin sau",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              StreamBuilder<List<String>>(
                stream: validation.streamPhones,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        if (snapshot.data!.length > 0)
                          const Text(
                            'Người tham gia kiểm duyệt:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        Wrap(
                          children: snapshot.data!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                            onPressed: () {
                                              validation
                                                  .removeObjectInListPhone(e);
                                            },
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              StreamBuilder<List<BodyApproveModel>>(
                stream: validation.streamBodyApproveData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        if (snapshot.data!.length > 0)
                          const Text(
                            'Nội dung kiểm duyệt:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        Column(
                          children: snapshot.data!
                              .map(
                                (e) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e.content,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          e.tag,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                            onPressed: () {
                                              validation
                                                  .removeObjectInListApprove(e);
                                            },
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 4,
                      height: 260,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: !snapshot.hasData
                                      ? const Color.fromRGBO(0, 0, 0, 0.15)
                                      : const Color.fromRGBO(88, 145, 255, 1),
                                )),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Người:',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.withOpacity(0.7)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    StreamBuilder<String>(
                                        stream: validation.streamPhoneApprove,
                                        builder: (context, snapshot) {
                                          return Expanded(
                                            child: TextFormField(
                                              onChanged:
                                                  validation.addPhoneApporve,
                                              controller:
                                                  TextEditingController()
                                                    ..text = snapshot.hasData
                                                        ? snapshot.data!
                                                        : '',
                                              decoration: const InputDecoration(
                                                hintText: 'Số điện thoại',
                                                hintStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Nội dung:',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.withOpacity(0.7)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    StreamBuilder<String>(
                                        stream: validation.streamBodyApprove,
                                        builder: (context, snapshot) {
                                          return Expanded(
                                            child: TextFormField(
                                              maxLines: 2,
                                              onChanged:
                                                  validation.addBodyApprove,
                                              decoration: InputDecoration(
                                                hintText: 'Kiểm duyệt',
                                                errorText: snapshot.hasError
                                                    ? '${snapshot.error}'
                                                    : null,
                                                hintStyle: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Kiểu:',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.withOpacity(0.7)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    StreamBuilder<String>(
                                        stream: validation.streamTagApporve,
                                        builder: (context, snapshot) {
                                          return Expanded(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              items: const [
                                                DropdownMenuItem(
                                                  child: Text("Văn bản"),
                                                  value: "txt",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Hình ảnh"),
                                                  value: "img",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("File pdf"),
                                                  value: "doc",
                                                )
                                              ],
                                              onChanged: (value) {
                                                if (value != null) {
                                                  validation.addTagApprove(
                                                      value as String);
                                                }
                                              },
                                              hint: Text(snapshot.hasData
                                                  ? snapshot.data!
                                                  : "Kiểm duyệt"),
                                              alignment: Alignment.center,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    StreamBuilder<BodyApproveModel>(
                                        stream:
                                            validation.streamButtonAddApporve,
                                        builder: (context, snapshot) {
                                          return ElevatedButton(
                                            onPressed: !snapshot.hasData
                                                ? null
                                                : () {
                                                    validation.addListApprove(
                                                        snapshot.data!);
                                                  },
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  88, 145, 255, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Chọn',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          );
                                        }),
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
              ),
            ],
          );
        });
  }
}
