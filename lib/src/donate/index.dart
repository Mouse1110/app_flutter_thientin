import 'package:app_flutter_thientin/src/donate/cubit/donate_cubit.dart';
import 'package:app_flutter_thientin/src/donate/views/view.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:app_flutter_thientin/src/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../transaction/cubit/transaction_cubit.dart';
import '../utils/money_format.dart';
import 'views/validations/data_validation.dart';

class Donate extends StatefulWidget {
  const Donate({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  final DonateDataValidation validation = DonateDataValidation();

  @override
  void initState() {
    context
        .read<DonateCubit>()
        .fetchTotalApi(context.read<LoginCubit>().user!.accessToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateState>(
      builder: (context, state) {
        if (state is DonateInitial) {
          print('DonateInitial ==========================');
          validation.addId(widget.id);
        } else if (state is DonateLoading) {
          print('DonateLoading');
          return const Splash();
        } else if (state is DonateError) {
          print('DonateError');
        } else if (state is DonateLoaded) {
          print('navigator');
          context.read<TransactionCubit>().transactionSave();
          context.read<HomeCubit>().notificationService.showNotification(
              id: 0,
              title: 'Ủng hộ thành công',
              payload: '/transaction|${widget.id}',
              body:
                  'Cảm ơn bạn đã ủng hộ chiến dịch với số tiền: ${MoneyFormat.formatMoney('${state.amount}')}');
          Navigator.pop(context);
        } else if (state is DonateTotalLoaded) {
          validation.addTotal(state.total);
        }
        return DonatePage(
          validation: validation,
        );
      },
    );
  }
}
