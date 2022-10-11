import 'package:app_flutter_thientin/src/approve/cubit/approve_cubit.dart';
import 'package:app_flutter_thientin/src/approve/models/form_model.dart';
import 'package:app_flutter_thientin/src/approve/screens/validation/data_validation.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:app_flutter_thientin/src/utils/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/api_constant.dart';

class ApproveInfoPage extends StatefulWidget {
  const ApproveInfoPage({
    Key? key,
    required this.validation,
  }) : super(key: key);
  final ApproveDataValidation validation;
  @override
  State<ApproveInfoPage> createState() => _ApproveInfoPageState();
}

class _ApproveInfoPageState extends State<ApproveInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ApproveCubit>().changePage(0);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<FormModel>(
              stream: widget.validation.streamForm,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              context.read<ApproveCubit>().changePage(0);
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Tiêu chí',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 10),
                                const Divider(),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.checkList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.checkSet![index]
                                                  .content,
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                                onPressed: () {
                                                  if (snapshot
                                                          .data!
                                                          .checkSet![index]
                                                          .type ==
                                                      "doc") {
                                                    PDFView.getFileFromUrl(
                                                            baseImage +
                                                                snapshot
                                                                    .data!
                                                                    .checkList[
                                                                        index]
                                                                    .data)
                                                        .then((value) =>
                                                            RouteNavigator.pushName(
                                                                context, '/pdf',
                                                                arguments: value
                                                                    .path));
                                                    return;
                                                  }
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              if (snapshot
                                                                      .data!
                                                                      .checkSet![
                                                                          index]
                                                                      .type ==
                                                                  "txt")
                                                                Text(snapshot
                                                                    .data!
                                                                    .checkList[
                                                                        index]
                                                                    .data),
                                                              if (snapshot
                                                                      .data!
                                                                      .checkSet![
                                                                          index]
                                                                      .type ==
                                                                  "img")
                                                                Image.network(
                                                                  baseImage +
                                                                      snapshot
                                                                          .data!
                                                                          .checkList[
                                                                              index]
                                                                          .data,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          title: Center(
                                                            child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .checkSet![
                                                                      index]
                                                                  .content,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          actions: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Thoát ra',
                                                                style: GoogleFonts.inder(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: const Text(
                                                    'Xem minh chứng')),
                                            const SizedBox(height: 10),
                                            const Divider(),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                context.read<ApproveCubit>().changePage(0);
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(26, 148, 255, 1)),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                    child: Text(
                                  'Huỷ bỏ',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Color.fromRGBO(26, 148, 255, 1)),
                                )),
                              ),
                            )),
                            SizedBox(width: 30),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                context.read<ApproveCubit>().fetchApproveApi(
                                    context
                                        .read<LoginCubit>()
                                        .user!
                                        .accessToken,
                                    idCampaign: snapshot.data!.idCampaign,
                                    idUser: snapshot.data!.idUser);
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(26, 148, 255, 1),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                    child: Text(
                                  'Chấp thuận',
                                  style: GoogleFonts.inter(
                                      fontSize: 14, color: Colors.white),
                                )),
                              ),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
        ),
      ),
    );
  }
}
