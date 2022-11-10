import 'package:flutter/material.dart';
import 'package:moru_digital_task/app/constants/constants.dart';
class AppButton extends StatelessWidget {
  String title;
  Color bgColor;
  Color titleColor;
  bool isFullWidth;
  AppButton({Key? key, required this.title, this.bgColor=AppColors.secondary, this.titleColor=AppColors.grey, this.isFullWidth=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: isFullWidth?Center(
        child: Text(title, textAlign: TextAlign.center,style: TextStyle(color: titleColor, fontWeight: FontWeight.bold,fontSize: AppDimens.NORMAL, )),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center,style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),),
        ],
      )
    );
  }
}
