import 'package:app_flutter_thientin/src/approve/cubit/approve_cubit.dart';
import 'package:app_flutter_thientin/src/approve/models/form_model.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:shimmer/shimmer.dart';

import '../validation/data_validation.dart';

class ApprovePage extends StatefulWidget {
  const ApprovePage({super.key, required this.validation});
  final ApproveDataValidation validation;
  @override
  State<ApprovePage> createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('/campaign');
        RouteNavigator.pushName(context, '/campaign',
            arguments: widget.validation.id.value);
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        RouteNavigator.pushName(context, '/campaign',
                            arguments: widget.validation.id.value);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'Thiện Tín',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'Danh sách người đăng ký',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(39, 39, 42, 1)),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ContainedTabBarView(
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Chưa kiểm duyệt',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Đã kiểm duyệt',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
                views: [
                  itemPageCensor(context, widget.validation),
                  itemPage(context, widget.validation),
                ],
              )),
              ElevatedButton(
                onPressed: widget.validation.formExists.hasValue
                    ? context.read<LoginCubit>().user!.data.permission == 2
                        ? widget.validation.formExists.value.length > 0
                            ? () {
                                context.read<ApproveCubit>().fetchDisburApi(
                                    context
                                        .read<LoginCubit>()
                                        .user!
                                        .accessToken,
                                    idCampaign: widget.validation.id.value);
                              }
                            : null
                        : null
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(88, 145, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      "Giải ngân ngay",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }

  Widget itemPageCensor(
      BuildContext context, ApproveDataValidation validation) {
    return StreamBuilder<List<FormModel>>(
        stream: validation.streamForms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              return Column(
                children: snapshot.data!
                    .map(
                      (e) => Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(39, 39, 42, 1)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      e.phone,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(128, 128, 137, 1)),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      validation.addForm(e);
                                      context
                                          .read<ApproveCubit>()
                                          .changePage(1);
                                    },
                                    child: Text(
                                      'Xem thêm',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider()
                        ],
                      ),
                    )
                    .toList(),
              );
            }
            return const Center(
              child: Text("Hiện chưa có người đăng ký"),
            );
          }
          return const Loading();
        });
  }

  Widget itemPage(BuildContext context, ApproveDataValidation validation) {
    return StreamBuilder<List<FormModel>>(
        stream: validation.streamFormExist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              return Column(
                  children: snapshot.data!
                      .map(
                        (e) => Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  39, 39, 42, 1)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          e.phone,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  128, 128, 137, 1)),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider()
                          ],
                        ),
                      )
                      .toList());
            }
            return const Center(
              child: Text("Hiện chưa có người được duyệt"),
            );
          }
          return const Loading();
        });
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.3),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: ((context, index) => Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ))));
  }
}
