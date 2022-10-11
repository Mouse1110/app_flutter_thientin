import 'package:file_picker/file_picker.dart';

class FilePickerCuston {
  static Future<String?> pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      return result.files.single.path;
    }
    return null;
  }
}
