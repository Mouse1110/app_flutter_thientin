import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/transaction/screens/info_transaction_page/view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/transaction_cubit.dart';
import 'cubit/transaction_state.dart';

import 'screens/transaction_page/view.dart';
import 'screens/validation/data_validation.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final TransactionDataValidation validation = TransactionDataValidation();
  @override
  void initState() {
    context.read<TransactionCubit>().page = 0;
    context.read<TransactionCubit>().fetchTransactionApi(
        context.read<LoginCubit>().user!.accessToken,
        id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
      if (state is TransactionInitial) {
      } else if (state is TransactionLoading) {
        print("TransactionLoading");
      } else if (state is TransactionError) {
        print("TransactionError");
      } else if (state is TransactionLoaded) {
        print("TransactionLoaded");
        validation.addTransactionSave(
            context.read<TransactionCubit>().saveTransaction);
        print(context.read<TransactionCubit>().saveTransaction);
        validation.addTransaction(state.transaction);
        validation.chartShow(state.transaction);
      } else if (state is InfoTransactionLoaded) {
        print("TransactionLoaded");
        validation.addInfoTransaction(state.data);
      }
      switch (context.read<TransactionCubit>().page) {
        case 0:
          return TransactionPage(validation: validation);
        case 1:
          return InfoTransactionPage(validation: validation);
        default:
          return TransactionPage(validation: validation);
      }
    });
  }
}
