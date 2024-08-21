import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _pickimg = ImagePicker();

  MediaService() {}

  Future<File?> getImagefromGallery() async {
    final XFile? _file = await _pickimg.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return File(_file.path);
    }
    return null;
  }
}
