import 'package:flutter/material.dart';
import 'package:moru_digital_task/app/constants/constants.dart';

class AppText extends StatelessWidget {
  String text;
  double? size;
  Color? textColor;
  FontWeight? fontWeight;


  AppText({Key? key, required this.text, this.size=AppDimens.SMALL,
     this.textColor=AppColors.grey, this.fontWeight=FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textColor, fontSize: size, fontWeight: fontWeight),);
  }
}
