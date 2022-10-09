import 'package:app_flutter_thientin/src/transaction/models/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/cubit/login_cubit.dart';
import '../../constants/color_contants.dart';
import '../../cubit/transaction_cubit.dart';
import '../../models/transaction_series.dart';
import '../components/info_charity_list.dart';
import '../components/loading.dart';
import '../components/title.dart';
import '../validation/data_validation.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    Key? key,
    required this.validation,
  }) : super(key: key);
  final TransactionDataValidation validation;
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const TitleComponent(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 180,
                  width: 300,
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromRGBO(14, 152, 210, 1)
                              .withOpacity(0.5))),
                  child: StreamBuilder<List<charts.Series<TranSeries, String>>>(
                      stream: widget.validation.streamSeries,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return charts.BarChart(
                            snapshot.data!,
                            animate: true,
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thông tin giao dịch',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: colorTran),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    StreamBuilder<List<TransactionModel>>(
                        stream: widget.validation.streamTransaction,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return StreamBuilder<int>(
                                stream: widget.validation.streamTransactionSave,
                                builder: (_, save) {
                                  if (save.hasData) {
                                    print(save.data);
                                    int i = save.data!;
                                    return Column(
                                      children: snapshot.data!
                                          .map((e) => Column(
                                                children: [
                                                  InfoTransaction(
                                                    amount: e.amount,
                                                    hash: e.hash,
                                                    type: e.type,
                                                    hint: --i >= 0 || false,
                                                    onClick: () {
                                                      widget.validation
                                                          .setHashIndex(e.hash);

                                                      context
                                                          .read<
                                                              TransactionCubit>()
                                                          .changePage(1);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    );
                                  }
                                  return const Loading();
                                });
                          }
                          return const Loading();
                        }),
                    const SizedBox(height: 20),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
