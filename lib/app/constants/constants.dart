import 'package:flutter/material.dart';

mixin AppColors {
  //null value means color not decided yet
  static const primary = Color(0xFF5d69b3);
  static const onPrimary = Colors.white;
  static const primaryContainer = null;
  static const onPrimaryContainer = null;
  static const secondary = Color(0xFFFDD159);
  static const onSecondary = Colors.white;
  static const secondaryContainer = null;
  static const onSecondaryContainer = null;
  static const tertiary = Color.fromRGBO(15, 39, 115, 1);
  static const onTertiary = Colors.white;
  static const tertiaryContainer = null;
  static const onTertiaryContainer = null;

  static const error = Color.fromRGBO(195, 3, 2, 1);
  static const onError = Colors.white;
  static const errorContainer = null;
  static const onErrorContainer = null;

  static const success = Color.fromRGBO(45, 140, 0, 1.0);
  static const onSuccess = Colors.white;
  static const successContainer = null;
  static const onSuccessContainer = null;

  static const neutral = Color.fromRGBO(15, 39, 115, 1);
  static const onNeutral = Colors.white;
  static const neutralContainer = null;
  static const onNeutralContainer = null;

  static const welcomeScreenMainTextColor = Color(0xFF989acd);
  static const bottomNavBgColor = Color(0xFFFAFAFA);

  static const blue = Color.fromRGBO(15, 39, 115, 1);
  static const red = Color.fromRGBO(195, 3, 2, 1);
  static const green = Color.fromRGBO(45, 140, 0, 1.0);
  static const black = Colors.black;
  static const grey = Colors.black54;
  static const whiteGrey = Colors.white54;

}

mixin AppImages {
  static const wallpaper = 'assets/images/wallpaper.jpg';
  static const frame = 'assets/images/frame.png';
  static const bg = 'assets/images/bg.png';
}

mixin AppIcons {
  static const qr = 'assets/icons/qr.png';
}

mixin AppDimens{
  static const SMALL=14.0;
  static const NORMAL=17.0;
  static const MEDIUM=20.0;
  static const LARGE=30.0;
}

mixin Constants{
  static const IS_FIRST_TIME = "is_first_time";
  static const String BASE_URL =
      "http://api.weatherapi.com/v1/";
  static const String API_KEY = "1bc0383d81444b58b1432929200711";
  static const String SAVED_LOCATION = "saved_location";
}
mixin ApiMethod{
  static const CURRENT = "current.json";
}
