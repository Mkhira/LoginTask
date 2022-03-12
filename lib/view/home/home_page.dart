



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logintask/constant/text_style_constant.dart';
import 'package:sizer/sizer.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key,required this.token}) : super(key: key);
  final String token;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(height: 8.h,),
                const  Center(child:  Icon(FontAwesomeIcons.user,size: 60,)),
                SizedBox(height: 3.h,),
                Text("Token: $token",style: TextStyleConstant.bodyText(context),)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
