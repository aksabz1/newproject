import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  LocationData? _currentLocation;
  LatLng? _tappedLocation;
  bool permissionDenied = false;
  String? _address;
  String? _detailAddress;
  TextEditingController addressController = TextEditingController();
  TextEditingController detailAddressController = TextEditingController();

  LocationData? get currentLocation => _currentLocation;
  LatLng? get tappedLocation => _tappedLocation;
  String? get address => _address;
  String? get detailAddress => _detailAddress;

  Future<void> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        permissionDenied = true;
        return;
      }
    }

    locationData = await location.getLocation();
    _currentLocation = locationData;
    getAddressFromLatLng(
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
    notifyListeners();
  }

  void setTappedLocation(LatLng? tappedLatLng) {
    _tappedLocation = tappedLatLng;
    getAddressFromLatLng(tappedLatLng ??
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
    notifyListeners();
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    String apiKey = 'service.c4db210ed5e74972960d1c5f009241dd';
    Response response = await Dio().get(
      'https://api.neshan.org/v5/reverse?lat=${latLng.latitude}&lng=${latLng.longitude}',
      options: Options(
        headers: {'api-key': apiKey},
      ),
    );
    _address = response.data['formatted_address'] + ' ';
    addressController.text = _address ?? '';
    notifyListeners();
  }

  void comleteAddress(String address, String detailAddress) {
    _address = address;
    _detailAddress = detailAddress;
    notifyListeners();
  }

  void clearTappedLocation() {
    _tappedLocation = null;
    notifyListeners();
  }
}
