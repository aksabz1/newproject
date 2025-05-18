import 'package:flutter/material.dart';

class Service {
  String name;
  String image;
  Service({required this.name, required this.image});
}

class ServicesChipProvider extends ChangeNotifier {
  final List<Service> _services = [
    Service(name: 'پروفایل ها', image: 'assets/images/avatar 1.png'),
    Service(name: 'کراتینه', image: 'assets/images/straight.png'),
    Service(name: 'فیشیال', image: 'assets/images/cleanser.png'),
    Service(name: 'کاشت مژه', image: 'assets/images/fake-eyelashes.png'),
    Service(name: 'کاشت ناخن', image: 'assets/images/nail 1.png'),
    Service(name: 'فیشیال', image: 'assets/images/cleanser.png'),
  ];
  List<Service> get services => _services;

  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
