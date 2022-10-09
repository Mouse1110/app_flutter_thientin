import 'dart:async';
import 'dart:io';

import 'package:app_flutter_thientin/src/create_campaign/models/campaign_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class CreateCampaignFormValidation {
  final _name = BehaviorSubject<String>();
  final _content = BehaviorSubject<String>();
  final timeForm = BehaviorSubject<int>();
  final timeDonate = BehaviorSubject<int>();
  final timeApprove = BehaviorSubject<int>();
  final timeDisbur = BehaviorSubject<int>();
  final _phoneApprove = BehaviorSubject<String>();

  // Content
  Function(String) get addName => _name.sink.add;
  Function(String) get addContent => _content.sink.add;
  Stream<String> get streamName => _name.stream.transform(validateName);
  Stream<String> get streamContent =>
      _content.stream.transform(validateContent);
  Stream<bool> get streamValidateContent =>
      Rx.combineLatest2(streamName, streamContent, (a, b) => true);
  // Time

  Stream<String> get streamTimeForm =>
      timeForm.stream.transform(validateTimeForm);
  Stream<String> get streamTimeDonate =>
      Rx.combineLatest2(timeForm.stream, timeDonate.stream, (a, b) {
        DateTime dateA = DateTime.fromMillisecondsSinceEpoch(a as int);
        DateTime dateB = DateTime.fromMillisecondsSinceEpoch(b as int);

        if (DateTime.now().difference(dateA).inDays > 0 ||
            dateA.difference(dateB).inDays > 0) {
          return '';
        }
        return '${dateB.day}/${dateB.month}/${dateB.year}';
      });
  Stream<String> get streamTimeApprove =>
      Rx.combineLatest3(timeForm.stream, timeDonate.stream, timeApprove.stream,
          (a, b, c) {
        DateTime dateA = DateTime.fromMillisecondsSinceEpoch(a as int);
        DateTime dateB = DateTime.fromMillisecondsSinceEpoch(b as int);
        DateTime dateC = DateTime.fromMillisecondsSinceEpoch(c as int);
        if (DateTime.now().difference(dateC).inDays > 0 ||
            dateB.difference(dateC).inDays > 0 ||
            dateA.difference(dateC).inDays > 0) {
          return '';
        }
        return '${dateC.day}/${dateC.month}/${dateC.year}';
      });
  Stream<String> get streamTimeDisbur => Rx.combineLatest4(
          timeForm.stream,
          timeDonate.stream,
          timeApprove.stream,
          timeDisbur.stream, (a, b, c, d) {
        DateTime dateA = DateTime.fromMillisecondsSinceEpoch(a as int);
        DateTime dateB = DateTime.fromMillisecondsSinceEpoch(b as int);
        DateTime dateC = DateTime.fromMillisecondsSinceEpoch(c as int);
        DateTime dateD = DateTime.fromMillisecondsSinceEpoch(d as int);
        if (DateTime.now().difference(dateD).inDays > 0 ||
            dateB.difference(dateD).inDays > 0 ||
            dateA.difference(dateD).inDays > 0 ||
            dateC.difference(dateD).inDays > 0) {
          return '';
        }
        return '${dateD.day}/${dateD.month}/${dateD.year}';
      });

  Stream<bool> get streamTime => Rx.combineLatest4(
      streamTimeForm,
      streamTimeDonate,
      streamTimeApprove,
      streamTimeDisbur,
      (a, b, c, d) => true);

  /// Transform
  ///
  ///
  ///
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    if (data.length < 5) {
      return sink.addError('Tên của chiến dịch quá ngắn');
    }
    if (data.length > 50) {
      return sink.addError('Tên không vượt quá 50 ký tự');
    }
    return sink.add(data);
  }));

  final validateContent =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    if (data.length < 20) {
      return sink.addError('Nội dung phải trên 30 ký tự');
    }
    if (data.length > 5000) {
      return sink.addError('Nội dung của bạn quá dài');
    }
    return sink.add(data);
  }));

  final validateTimeForm =
      StreamTransformer<int, String>.fromHandlers(handleData: ((data, sink) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data);
    if (DateTime.now().difference(date).inDays > 0) {
      return sink.addError("Thời gian không thể ở quá khứ");
    }
    sink.add('${date.day}/${date.month}/${date.year}');
  }));

  Function(int) get addTimeForm => timeForm.sink.add;
  Function(int) get addTimeDonate => timeDonate.sink.add;
  Function(int) get addTimeAprrove => timeApprove.sink.add;
  Function(int) get addTimeDisbur => timeDisbur.sink.add;

  //// Kiểm duyệt
  ///
  List<String> phone = [];
  void addPhoneApporve(String data) {
    if (data.length == 11) {
      String key = data[data.length - 1];
      if (key == " ") {
        _phoneApprove.sink.add('');
        phone.add(data.replaceAll(RegExp(' '), ''));
        addPhone(phone);
      }
    }
  }

  Stream<String> get streamPhoneApprove => _phoneApprove.stream;
  final phones = BehaviorSubject<List<String>>();
  Function(List<String>) get addPhone => phones.sink.add;
  Stream<List<String>> get streamPhones => phones.stream;

  final _bodyApprove = BehaviorSubject<String>();
  Function(String) get addBodyApprove => _bodyApprove.sink.add;
  Stream<String> get streamBodyApprove =>
      _bodyApprove.stream.transform(validateBodyApprove);
  final validateBodyApprove =
      StreamTransformer<String, String>.fromHandlers(handleData: ((data, sink) {
    if (data.length < 20) {
      return sink.addError("Nội dung kiểm duyệt quá ngắn");
    }
    if (data.length > 1000) {
      return sink.addError("Nội dung kiểm duyệt quá dài");
    }
    sink.add(data);
  }));
  final _tagApprove = BehaviorSubject<String>();
  Function(String) get addTagApprove => _tagApprove.sink.add;
  Stream<String> get streamTagApporve => _tagApprove.stream;
  Stream<BodyApproveModel> get streamButtonAddApporve => Rx.combineLatest2(
      streamBodyApprove,
      _tagApprove.stream,
      (a, b) => BodyApproveModel(content: a as String, tag: b as String));
  List<BodyApproveModel> apporves = [];
  final _bodyApproveData = BehaviorSubject<List<BodyApproveModel>>();
  Stream<List<BodyApproveModel>> get streamBodyApproveData =>
      _bodyApproveData.stream;
  Stream<bool> get streamApporve =>
      Rx.combineLatest2(streamPhones, streamBodyApproveData, (a, b) => true);

  ///
  Stream<bool> get streamButtonFinish => Rx.combineLatest3(
      streamValidateContent, streamTime, streamApporve, (a, b, c) => true);

  final _image = BehaviorSubject<XFile>();

  Function(XFile) get addImage => _image.sink.add;
  Stream<XFile> get streamImage => _image.stream;

  ///Event
  ///
  ///
  void addListApprove(BodyApproveModel data) {
    apporves.add(data);
    _bodyApproveData.sink.add(apporves);
    _tagApprove.sink.add('');
  }

  Future<CampaignRequestModel> joinDataCampaign() async {
    return CampaignRequestModel(
        img: File(_image.value.path),
        name: _name.value,
        content: _content.value,
        dateRegistration: timeForm.value,
        dateCharity: timeDonate.value,
        dateApprove: timeApprove.value,
        dateDisbur: timeDisbur.value,
        checkList:
            CheckList(person: phones.value, body: _bodyApproveData.value));
  }
}
