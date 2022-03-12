



import 'package:flutter/material.dart';
import 'package:logintask/constant/image_constant.dart';
import 'package:logintask/constant/size_data.dart';
import 'package:sizer/sizer.dart';
import 'image_view.dart';

class LogoView extends StatelessWidget {
  const LogoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
          height: 20.h,
          width: SizeDataConstant.customWidth(context, 1.2),
          child: ImageView(path: ImageConstant.logo,)),
    );
  }
}
