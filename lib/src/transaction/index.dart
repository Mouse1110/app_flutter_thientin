import 'package:app_flutter_thientin/src/transaction/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/index.dart';
import '../login/cubit/login_cubit.dart';
import '../splash/index.dart';
import 'cubit/transaction_cubit.dart';
import 'cubit/transaction_state.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TransactionCubit>().fetchTransactionApi(
        id: '', accessToken: context.read<LoginCubit>().user!.accessToken);
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
      if (state is TransactionLoading) {
        print("Login Loading");
        return const Splash();
      } else if (state is TransactionError) {
        ErrorPage.push(context: context, error: state.failure.message);
      } else if (state is TransactionLoaded) {
        print("Login Loaded:${state.transaction.blockHash}");
        return const TransactionPage(
            // campaign: state.campaign,
            );
      }
      return const Splash();
    });
  }

  static Future<void> push({required BuildContext context}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Transaction()));
    });
  }

  static Future<void> pop({required BuildContext context}) async {
    SystemNavigator.pop();
  }
}
