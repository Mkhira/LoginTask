


import 'package:flutter/material.dart';
import 'package:logintask/constant/color_constant.dart';
import 'package:logintask/constant/text_style_constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
class DataErrorAlert {
  static showError(
      {
        required String data,
        required BuildContext context}) {
    Alert(         closeIcon: const Icon(Icons.close,size: 30,),
        closeFunction: (){
          Navigator.pop(context);
        },
        context: context,
        // title: title,
        desc: data,
        style: AlertStyle(
            overlayColor: Colors.grey.withOpacity(.8),
            titleStyle: TextStyleConstant.headLineErrorText(context),
      ),
        buttons: [
          DialogButton(
            child: Text(
                "ok",
                style: TextStyleConstant.buttonText(context)),
            onPressed: () {
              Navigator.pop(context);
            },
            color: ColorConstant.mainColor,
          )
        ]).show();
  }


  static userCreatedSuccess(
      {
        required BuildContext context}) {
    Alert(         closeIcon: const Icon(Icons.close,size: 30,),
        closeFunction: (){
          Navigator.pop(context);
        },
        image: Container(
            height: 10.h,
            width: 10.h,
            decoration:const  BoxDecoration(
                color: Color(0xff43DC2D),
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.check,color: Colors.white,size: 40,)),
        context: context,
        desc: "User successfully registered ",
        style: AlertStyle(
            overlayColor: Colors.grey.withOpacity(.8),
            isOverlayTapDismiss: false,

            descStyle: TextStyleConstant.bodyText(context)),
        buttons: [
          DialogButton(
            border:
            Border.all(color: ColorConstant.mainColor),
            child: Text(
                 "ok",
                style: TextStyleConstant.captionText(context)),
            onPressed: () {

              Navigator.of(context, rootNavigator: true).pop();
            },
            color: Colors.white,
          ),
        ]).show();
  }
}