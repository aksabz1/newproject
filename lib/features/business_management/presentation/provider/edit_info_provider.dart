import 'package:flutter/material.dart';
import 'package:salons/features/advertise/presentation/provider/beautician_form_provider.dart';

class EditInfoProvider extends ChangeNotifier {
  final List<Service> _hairServices = [
    Service(name: 'کوتاهی مو'),
    Service(name: 'رنگ مو '),
    Service(name: 'شنیون مو'),
    Service(name: 'بافت مو'),
    Service(name: 'براشینگ مو'),
    Service(name: 'احیا مو'),
    Service(name: 'اکستنشن مو'),
    Service(name: 'کراتین مو'),
  ];
  final List<Service> _skinServices = [
    Service(name: 'فیشیال'),
    Service(name: 'پاکسازی'),
    Service(name: 'میکاپ'),
    Service(name: 'اپیلاسیون'),
    Service(name: 'تتو بدن'),
  ];
  final List<Service> _nailServices = [
    Service(name: 'مانیکور'),
    Service(name: 'پدیکور'),
    Service(name: 'ژلیش'),
    Service(name: 'لمینت ناخن'),
  ];
  final List<Service> _eyelashshServices = [
    Service(name: 'اکستنشن مژه'),
    Service(name: 'لیفت مژه'),
    Service(name: 'لمینت مژه'),
    Service(name: 'بن مژه'),
  ];





  List<Service> get hairServices => _hairServices;
  List<Service> get skinServices => _skinServices;
  List<Service> get nailServices => _nailServices;
  List<Service> get eyelashServices => _eyelashshServices;

  void selectHairServices(int index, bool selected) {
    _hairServices[index].isSelected = selected;
    notifyListeners();
  }

  void selectSkinServices(int index, bool selected) {
    _skinServices[index].isSelected = selected;
    notifyListeners();
  }

  void selectNailServices(int index, bool selected) {
    _nailServices[index].isSelected = selected;
    notifyListeners();
  }

  void selectEyelashServices(int index, bool selected) {
    _eyelashshServices[index].isSelected = selected;
    notifyListeners();
  }

}
