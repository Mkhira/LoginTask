










import 'package:flutter/material.dart';
import 'package:logintask/constant/text_style_constant.dart';
import 'package:logintask/widget/logo_view.dart';
import 'package:sizer/sizer.dart';

import '../login_screen/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 1)).whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen())));
    super.initState();
  }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
             const LogoView(),
              SizedBox(height: 20.h,),

              Text("eMagine Solutions",style: TextStyleConstant.headLineText(context),)


            ],
          ),
        ),
      ),
    ),
    );
  }
}
