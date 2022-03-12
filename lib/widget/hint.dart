




import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant/text_style_constant.dart';
class HintWidget extends StatelessWidget {
  const HintWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Column(
      children: [
        SizedBox(height: 2.h),
        Text(
          "E-mail that assign to login ",
          style: TextStyleConstant.bodyText(context),
        ),
        Text(
          "george.bluth@reqres.in , janet.weaver@reqres.in",
          style: TextStyleConstant.captionText(context),
        ),
        Text(
          "emma.wong@reqres.in , eve.holt@reqres.in",
          style: TextStyleConstant.captionText(context),
        ),
        Text(
          "charles.morris@reqres.in , tracey.ramos@reqres.in",
          style: TextStyleConstant.captionText(context),
        ),
      ],
    );
  }
}
