import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../cubit/login_cubit.dart';

class FormValidation {
  final _formPhone = BehaviorSubject<String>();
  final _formPass = BehaviorSubject<String>();
  final _visiblePass = BehaviorSubject<bool>();
  //Get
  Stream<String> get streamPhone =>
      _formPhone.stream.transform(validateFormName);
  Stream<String> get streamPass => _formPass.stream.transform(validateFormPass);
  Stream<bool> get streamVisiblePass => _visiblePass.stream;
  Stream<bool> get streamValidateSubmit =>
      Rx.combineLatest2(streamPhone, streamPass, (phone, pass) => true);
  //Set
  Function(String) get changePhone => _formPhone.sink.add;
  Function(String) get changePass => _formPass.sink.add;
  Function(bool) get changvisiblePass => _visiblePass.sink.add;

  dispose() {
    _formPhone.close();
    _formPass.close();
    _visiblePass.close();
  }

  // Tranformers
  final validateFormName =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    if (data.length != 10) {
      sink.addError("Số điện thoại không hợp lệ");
    } else {
      try {
        int.parse(data);
        sink.add(data);
      } catch (e) {
        sink.addError("Số điện thoại không hợp lệ");
      }
    }
  }));

  // Tranformers
  final validateFormPass =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    if (data.length < 5) {
      sink.addError("Số điện thoại không hợp lệ");
    } else {
      sink.add(data);
    }
  }));

  // Event

  callSubmit({required BuildContext context}) {
    context
        .read<LoginCubit>()
        .fetchLoginApi(phone: _formPhone.value, pass: _formPass.value);
  }
}
