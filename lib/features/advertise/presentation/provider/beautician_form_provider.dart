import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Service {
  String name;
  bool isSelected;
  String minPrice;
  String maxPrice;
  Service(
      {required this.name,
      this.isSelected = false,
      this.minPrice = '',
      this.maxPrice = ''});
}

class BeauticianFormProvider extends ChangeNotifier {
  bool hasSalon = false;
  final List<File?> _images = [null, null, null, null];
  List<Service> _services = [];
  final List<Service> _selectedServices = [];
  final GlobalKey<FormState> _adNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _salonNameKey = GlobalKey<FormState>();

  List<File?> get images => _images;
  List<Service> get services => _services;
  List<Service> get selectedServices => _selectedServices;
  GlobalKey<FormState> get adNameKey => _adNameKey;
  GlobalKey<FormState> get phoneKey => _phoneKey;
  GlobalKey<FormState> get salonNameKey => _salonNameKey;
  final ImagePicker _imagePicker = ImagePicker();

  void changeHasSalonTrue() {
    hasSalon = true;
    notifyListeners();
  }

  void changeHasSalonFalse() {
    hasSalon = false;
    notifyListeners();
  }

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

  void clearImages() {
    _images.clear();
    _images.addAll([null, null, null, null]);
    notifyListeners();
  }

  void setServices(List<Service> services) {
    _services = services;
    notifyListeners();
  }

  void selectServices(int index, bool selected) {
    _services[index].isSelected = selected;
    if (selected) {
      _selectedServices.add(_services[index]);
    } else {
      _selectedServices.remove(_services[index]);
    }
    notifyListeners();
  }

  void changeServiceMinPrice(int index, String minPrice) {
    _selectedServices[index].minPrice = minPrice;
    notifyListeners();
  }

  void changeServiceMaxPrice(int index, String maxPrice) {
    _selectedServices[index].maxPrice = maxPrice;
    notifyListeners();
  }
}
