




import 'package:flutter/material.dart';
import 'package:logintask/constant/color_constant.dart';
import 'package:logintask/constant/size_data.dart';

class AppTextField extends StatelessWidget {
   AppTextField({Key? key,required this.controller,required this.hint,required this.label,this.widthRatio = 1.1,required this.validation,required this.inputType,this.password = false,this.textInputAction}) : super(key: key);
 final String hint;
 final String label;
 final String? Function(String?) validation;
 final TextEditingController controller;
 final TextInputType inputType;
 double widthRatio;
 TextInputAction? textInputAction;
 bool password;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: SizeDataConstant.customWidth(context, widthRatio),
      child: TextFormField(
        validator: validation,
        controller: controller,
        keyboardType: inputType,
        obscureText:password,
        textInputAction: textInputAction,

        decoration:   InputDecoration(
          isDense: false,
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(color: ColorConstant.mainColor),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:  Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:  ColorConstant.mainColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder:const  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),

        ),

      ),
    );
  }
}
