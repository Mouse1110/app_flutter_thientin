import 'package:app_flutter_thientin/src/login/models/failure_model.dart';
import 'package:app_flutter_thientin/src/login/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.apiRepository}) : super(LoginInitial());
  final ApiRepository apiRepository;

  Future<void> fetchLoginApi(
      {required String phone, required String pass}) async {
    emit(LoginLoading());
    try {
      final User? user = await apiRepository.login(phone: phone, pass: pass);
      emit(LoginLoaded(user: user!));
    } on Failure catch (e) {
      emit(LoginError(failure: e));
    } catch (e) {
      print('Error:$e');
    }
  }
}
