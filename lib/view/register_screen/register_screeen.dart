
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logintask/constant/color_constant.dart';
import 'package:logintask/constant/size_data.dart';
import 'package:logintask/constant/text_style_constant.dart';
import 'package:logintask/controller/google_login/google_cubit.dart';
import 'package:logintask/controller/rigister/rigister_controller.dart';
import 'package:logintask/controller/rigister/rigister_state.dart';
import 'package:logintask/helper/validation.dart';
import 'package:logintask/main.dart';
import 'package:logintask/widget/alert.dart';
import 'package:logintask/widget/app_button.dart';
import 'package:logintask/widget/app_text_feild.dart';
import 'package:logintask/widget/logo_view.dart';
import 'package:sizer/sizer.dart';

import '../../repository/google_service.dart';
import '../../controller/google_login/google_state.dart';
import '../../widget/hint.dart';
import '../../widget/social_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConstant.mainColor,
            title: Text("Register",style: TextStyleConstant.headLineWhiteText(context),),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
                key: formKey,
                child: Hero(
                  tag: "login-register",

                  child: Material(

                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),

                        Text("",style: TextStyleConstant.headLineText(context),),
                        const HintWidget(),
                        const LogoView(),
                        AppTextField(
                            hint: "",
                            inputType: TextInputType.emailAddress,
                            controller: RegisterCubit.get(context).emailController,
                            label: "E-mail",
                            validation: Validation.emailValidationResult),
                        SizedBox(height: 3.h,),
                        AppTextField(
                            hint: "",
                            inputType: TextInputType.visiblePassword,
                            controller: RegisterCubit.get(context).passwordController,
                            password: true,
                            label: "Password",
                            validation: Validation.passwordValidationResult),
                        SizedBox(height: 8.h,),

                        BlocConsumer<RegisterCubit,RegisterState>(builder: (context,state){
                          return  AppButton(color: ColorConstant.mainColor, textStyle: TextStyleConstant.buttonText(context), title: "Register", onPressed: (){
                            if(formKey.currentState!.validate()){
                              RegisterCubit.get(context).register(context);
                            }
                          });
                        }, listener: (context,state){
                          if(state is RegisterStateSuccess){
                            DataErrorAlert.userCreatedSuccess(context: context);
                          }else if(state is RegisterStateError){
                            DataErrorAlert.showError(data: RegisterCubit.get(context).errorModel.error!, context: context);
                          }
                        }),
                        SizedBox(height: 3.h,),
                        SizedBox(
                          width: SizeDataConstant.customWidth(context,1.1),
                          height: 2.h,

                          child: Row(

                            children: [
                              Expanded(child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Have account? Login",style: TextStyleConstant.bodyText(context),))),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Text("Social Registration",style: TextStyleConstant.headLineText(context),),

                        SizedBox(height: 1.h,),
                        const SocialWidget(),
                        SizedBox(height: 3.h,),                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
