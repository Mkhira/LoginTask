



import 'package:flutter/material.dart';

class SizeDataConstant{
  static fullWidth(BuildContext context)=> MediaQuery.of(context).size.width;
  static customWidth(BuildContext context,double value)=>( MediaQuery.of(context).size.width/value);
}