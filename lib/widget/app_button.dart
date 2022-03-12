



import 'package:flutter/material.dart';
import 'package:logintask/constant/size_data.dart';
import 'package:sizer/sizer.dart';
class AppButton extends StatelessWidget {
  AppButton({Key? key,this.radius =8,required this.color,required this.textStyle,required this.title, this.widthRatio =1.3, this.heightRatio =6,required this.onPressed,this.withBorder = false,this.disable = false}) : super(key: key);
  final String title;
  final TextStyle textStyle;
  final Color color;
  double? heightRatio;
  double? widthRatio;
  bool? withBorder;
  double? radius;
  bool? disable;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeDataConstant.customWidth(context, widthRatio!),
      child: MaterialButton(
        height: heightRatio!.h,
        splashColor: Colors.white,
        onPressed: disable == false ?onPressed:(){},
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        color: disable == false? withBorder == false? color :Colors.white: Colors.grey ,
        shape: withBorder == false? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)
        ):RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
          side: BorderSide(
              color: color,

              width: 1
          ),
        ),
        child: Text(title,style: textStyle,),
      ),
    );
  }
}
