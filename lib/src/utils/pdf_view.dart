import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PDFView {
  static Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'file';
    if (name != null) {
      fileName = name;
    }
    try {
      var res = await Dio().get(url);

      var bytes = res.data;
      print(bytes);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Không thể load file");
    }
  }
}
