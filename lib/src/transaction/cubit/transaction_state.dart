import 'package:app_flutter_thientin/src/transaction/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

import '../models/failure_model.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  const TransactionLoaded({required this.transaction});
  final TransactionModel transaction;

  @override
  List<Object> get props => [transaction];
}

class TransactionError extends TransactionState {
  final Failure failure;
  const TransactionError({required this.failure});

  @override
  List<Object> get props => [failure];
}
