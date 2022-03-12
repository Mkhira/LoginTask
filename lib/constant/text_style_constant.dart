





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logintask/constant/color_constant.dart';

class TextStyleConstant{

  static headLineText(BuildContext context) => Theme.of(context).textTheme.headline4!.copyWith(color:ColorConstant.mainColor );
  static headLineWhiteText(BuildContext context) => Theme.of(context).textTheme.headline4!.copyWith(color:ColorConstant.whiteColor );
  static headLineErrorText(BuildContext context) => Theme.of(context).textTheme.headline6!.copyWith(color:ColorConstant.redColor );
  static buttonText(BuildContext context) => Theme.of(context).textTheme.button!.copyWith(color:ColorConstant.whiteColor );
  static bodyText(BuildContext context) => Theme.of(context).textTheme.bodyText1!.copyWith(color:ColorConstant.mainColor );
  static captionText(BuildContext context) => Theme.of(context).textTheme.caption!.copyWith(color:Colors.grey );
}