import 'package:app_flutter_thientin/src/transaction/models/info_transaction_model.dart';
import 'package:app_flutter_thientin/src/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../login/cubit/login_cubit.dart';
import '../../constants/color_contants.dart';
import '../../cubit/transaction_cubit.dart';
import '../components/title.dart';
import '../validation/data_validation.dart';

class InfoTransactionPage extends StatefulWidget {
  const InfoTransactionPage({
    Key? key,
    required this.validation,
  }) : super(key: key);
  final TransactionDataValidation validation;
  @override
  State<InfoTransactionPage> createState() => _InfoTransactionPageState();
}

class _InfoTransactionPageState extends State<InfoTransactionPage> {
  Widget _transaction() => StreamBuilder<InfoTransactionModel>(
      stream: widget.validation.streamInfoTransaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Item(
                tilte: 'Mã hash của bạn:',
                text: snapshot.data!.hash,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Item(
                tilte: 'Mã của khối đã lưu:',
                text: snapshot.data!.blockHash,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                tilte: 'Vị trí khối trong chuỗi:',
                text: '${snapshot.data!.blockNumber}',
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Item(
                tilte: 'Được gửi từ địa chỉ:',
                text: snapshot.data!.from,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                tilte: 'Người nhận có địa chỉ:',
                text: snapshot.data!.to,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Item(
                tilte: 'Số tiền trong giao dịch:',
                text: MoneyFormat.formatMoney('${snapshot.data!.value}'),
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                tilte: 'Ngày giao dịch:',
                text: '${snapshot.data!.date}',
              ),
            ],
          );
        }
        return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.3),
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
      });

  @override
  void initState() {
    print(widget.validation.hash);
    context.read<TransactionCubit>().fetchInfoTransactionApi(
          context.read<LoginCubit>().user!.accessToken,
          hash: widget.validation.hash,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const TitleComponent(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              _transaction(),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.text,
    required this.tilte,
  }) : super(key: key);
  final String tilte;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tilte,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.withOpacity(0.75)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: colorTran),
          )
        ],
      ),
    );
  }
}
