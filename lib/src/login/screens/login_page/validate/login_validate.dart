import 'dart:async';

class FormValidate {
  String _name = '';
  String _pass = '';
  StreamController nameController = StreamController<String>();
  StreamController passController = StreamController<String>();

  Stream get nameStream => nameController.stream;
  Stream get passStream => passController.stream;

  void onChangedName(String text) {
    _name = text;
  }

  void onChangedPass(String text) {
    _pass = text;
  }
}
