import 'dart:io';

import 'package:app_flutter_thientin/src/apply/screens/validations/form_validation.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:app_flutter_thientin/src/utils/file_picker.dart';
import 'package:app_flutter_thientin/src/utils/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker.dart';
import '../cubit/apply_cubit.dart';

class ApplyPage extends StatefulWidget {
  const ApplyPage({
    Key? key,
    required this.validation,
  }) : super(key: key);
  final ApplyFormValidation validation;

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  Widget _geneCheckList(ApplyFormValidation validation) =>
      StreamBuilder<CampaignModel>(
          stream: widget.validation.streamCheckList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.checkList.body.map((e) {
                  int index = snapshot.data!.checkList.body.indexOf(e);
                  return Column(
                    children: [
                      Item(
                        data: e,
                        index: index,
                        validation: validation,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }).toList(),
              );
            }
            return const SizedBox.shrink();
          });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.validation.checkList.hasValue) {
          RouteNavigator.pushName(context, '/campaign',
              arguments: '${widget.validation.checkList.value.idCaimpain}');
        } else {
          RouteNavigator.pushName(context, '/home');
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    const Header(),
                    _geneCheckList(widget.validation),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                )),
                StreamBuilder<int>(
                    stream: widget.validation.streamButton,
                    builder: (context, snapshot) {
                      return Positioned(
                        bottom: 0,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (widget.validation.checkList.hasValue) {
                                    RouteNavigator.pushName(
                                        context, '/campaign',
                                        arguments:
                                            '${widget.validation.checkList.value.idCaimpain}');
                                  } else {
                                    RouteNavigator.pushName(context, '/home');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: const BorderSide(
                                      color:
                                          const Color.fromRGBO(88, 145, 255, 1),
                                      width: 0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Thoát ra",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: !snapshot.hasData
                                    ? null
                                    : () {
                                        Popup.show(context,
                                            title: "Thông báo",
                                            body:
                                                "Bạn có chắc muốn nộp đơn này ?",
                                            accept: () async {
                                          Navigator.pop(context);
                                          context
                                              .read<ApplyCubit>()
                                              .fetchFileApi(
                                                  context
                                                      .read<LoginCubit>()
                                                      .user!
                                                      .accessToken,
                                                  path: await widget.validation
                                                      .getFile(),
                                                  campaignId: snapshot.data!);
                                        });
                                      },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(88, 145, 255, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
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
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.data,
    required this.index,
    required this.validation,
  }) : super(key: key);
  final ApplyFormValidation validation;
  final BodyCheckListModel data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: validation.streamInput[index],
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TitleItem(
                  index: index,
                  isFinish: snapshot.hasData,
                  title: data.content,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: 4,
                        height: 120,
                        color: const Color.fromRGBO(0, 0, 0, 0.15)),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "| Thông tin này sẽ được ghi lại",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (data.type == "txt")
                          TextFormField(
                            onChanged: validation.input[index].sink.add,
                            decoration: InputDecoration(
                                hintText: 'Nhập thông tin',
                                hintStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                        if (data.type == "img")
                          !snapshot.hasData
                              ? TextButton.icon(
                                  onPressed: () async {
                                    XFile? image =
                                        await ImagePickerCustom.pickImage();
                                    validation.input[index].sink
                                        .add(image!.path);
                                  },
                                  icon: const Icon(Icons.file_upload),
                                  label: const Text('Chọn hình ảnh'))
                              : InkWell(
                                  onTap: () async {
                                    XFile? image =
                                        await ImagePickerCustom.pickImage();
                                    validation.input[index].sink
                                        .add(image!.path);
                                  },
                                  child: Image.file(
                                    File(snapshot.data!),
                                    height: 50,
                                  ),
                                ),
                        if (data.type == "doc")
                          !snapshot.hasData
                              ? TextButton.icon(
                                  onPressed: () async {
                                    String? path =
                                        await FilePickerCuston.pick();
                                    validation.input[index].sink.add(path!);
                                  },
                                  icon: const Icon(Icons.file_upload),
                                  label: const Text('Chọn file pdf'))
                              : TextButton(
                                  onPressed: () async {
                                    String? path =
                                        await FilePickerCuston.pick();
                                    validation.input[index].sink.add(path!);
                                  },
                                  child: Text(
                                    snapshot.data!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                      ],
                    ))
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class TitleItem extends StatelessWidget {
  const TitleItem({
    Key? key,
    required this.index,
    required this.isFinish,
    required this.title,
  }) : super(key: key);
  final int index;
  final String title;
  final bool isFinish;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2,
                        color: !isFinish
                            ? const Color.fromRGBO(242, 167, 125, 1)
                            : const Color.fromRGBO(88, 145, 255, 1))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: !isFinish
                          ? const Color.fromRGBO(242, 167, 125, 1)
                          : const Color.fromRGBO(88, 145, 255, 1)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: !isFinish
                  ? const Color.fromRGBO(242, 167, 125, 1)
                  : const Color.fromRGBO(88, 145, 255, 1)),
          child: Text(
            !isFinish ? "Chưa nhập" : "Hoàn thành",
            style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(88, 145, 255, 1),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2))
          ]),
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Stack(
        children: [
          Positioned(
              right: 52,
              top: -23,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(255, 255, 255, 1)
                        .withOpacity(0.25)),
              )),
          Positioned(
              right: -12,
              bottom: -11,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(255, 255, 255, 1)
                        .withOpacity(0.25)),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(
                    Icons.warning_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Bạn phải nhập đủ các thông tin bên dưới để hoàn thành xác minh",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
