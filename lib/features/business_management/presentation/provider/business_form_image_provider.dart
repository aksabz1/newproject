import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BusinessFormImageProvider extends ChangeNotifier {
  final List<File?> _images = [null, null, null, null];

  List<File?> get image => _images;

  final ImagePicker _imagePicker = ImagePicker();
  Future<void> pickImage(int index) async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _images[index] = File(pickedImage.path);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    _images[index] = null;
    notifyListeners();
  }
}
