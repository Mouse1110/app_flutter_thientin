import 'package:app_flutter_thientin/src/approve/models/form_model.dart';

import 'package:rxdart/rxdart.dart';

class ApproveDataValidation {
  final _forms = BehaviorSubject<List<FormModel>>();
  Function(List<FormModel>) get addForms => _forms.sink.add;
  Stream<List<FormModel>> get streamForms => _forms.stream;

  final formExists = BehaviorSubject<List<FormModel>>();
  Function(List<FormModel>) get addFormExist => formExists.sink.add;
  Stream<List<FormModel>> get streamFormExist => formExists.stream;

  final _form = BehaviorSubject<FormModel>();
  Function(FormModel) get addForm => _form.sink.add;
  Stream<FormModel> get streamForm => _form.stream;

  final id = BehaviorSubject<String>();
  Function(String) get addId => id.sink.add;
  dispose() {
    _forms.close();
  }
}
