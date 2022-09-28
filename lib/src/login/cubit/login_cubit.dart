import 'package:app_flutter_thientin/src/login/models/failure_model.dart';
import 'package:app_flutter_thientin/src/login/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/login/screens/index_page/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/flash_message_component.dart';
import '../models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.apiRepository}) : super(LoginInitial());
  final ApiRepository apiRepository;

  Future<void> fetchLoginApi(BuildContext context,
      {required String phone, required String pass}) async {
    // emit(LoginLoading());
    try {
      final User? user = await apiRepository.login(phone: phone, pass: pass);
      this.user = user;
      emit(LoginLoaded(user: user!));
    } on Failure catch (e) {
      //  emit(LoginError(failure: e));
      ScaffoldMessenger.of(context)
          .showSnackBar(FlashMessage.popup("Có lỗi", e.message));
    } catch (e) {
      print('Error:$e');
      // emit(LoginError(failure: Failure(message: '$e')));
      ScaffoldMessenger.of(context)
          .showSnackBar(FlashMessage.popup("Có lỗi", '$e'));
    }
  }

  Future nav({Widget? page}) async {
    emit(LoginNav(page: page ?? const IndexLoginPage()));
  }

  /// Data global
  User? user;
}
