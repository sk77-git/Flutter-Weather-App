import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moru_digital_task/app/constants/constants.dart';
import 'package:moru_digital_task/app/data/response/weather_response.dart';

import '../../../data/network/api.dart';

class HomeController extends GetxController {
  final  isLoading= true.obs;
  final  isLocationSaved= false.obs;
  final weatherResponse= <WeatherResponse>[];

  String? _currentAddress;
  Position? _currentPosition;
  var searchTextFieldController= TextEditingController();
  final storage= GetStorage();
  @override
  void onInit() {
    super.onInit();
    if (storage.read(Constants.SAVED_LOCATION)==null) {
      isLocationSaved.value=false;
    }else{
      isLocationSaved.value=true;
    }
    /*If location is saved get that saved location*/
   if (isLocationSaved.value) {
     getWeather(storage.read(Constants.SAVED_LOCATION));
   }  else{
     _getCurrentPosition();
   }
  }

  @override
  void onReady() {
    log("HomeController:onReady");
    super.onReady();
  }

  @override
  void onClose() {}



  void getWeather(location) async {
    isLoading.value = true;
    var data = await Api().fetchWeather(location);
    log("getWeather:$data");
    if (data != null) {
      weatherResponse.clear();
      weatherResponse.add( WeatherResponse.fromJson(data));
      // searchTextFieldController.text= weatherResponse[0].location!.name.toString();
    }
    isLoading.value = false;
  }


  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      /*If problem in permission show weather of Kathmandu temporarily*/
      getWeather("Kathmandu");
      return;
    }
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      /*If location got, then get weather by lat lang*/
      getWeather("${_currentPosition?.latitude},${_currentPosition?.longitude}");
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  /*To check if required permission are available*/
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("GPS not turned ON", "Location services are disabled. Please enable the services and refresh the page.",snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.whiteGrey);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Denied, Search Location Manually", "Location permissions are permanently denied, we cannot request permissions.", snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.whiteGrey);
      return false;
    }
    return true;
  }


  /*This Function can be used later to get location name from lat lang*/
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress =
      '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      log("Address:$_currentAddress");
    }).catchError((e) {
      debugPrint(e);
    });
  }


  /*To Update the location name that is shown on screen*/
  void onSavePressed() {
    storage.write(Constants.SAVED_LOCATION, weatherResponse[0].location!.name.toString());
    Get.snackbar("Location saved:${weatherResponse[0].location!.name.toString()}", "This place data will be fetched next time automatically", snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.whiteGrey);
    if (storage.read(Constants.SAVED_LOCATION)=="") {
      isLocationSaved.value=false;
    }else{
      isLocationSaved.value=true;
    }
  }
}
