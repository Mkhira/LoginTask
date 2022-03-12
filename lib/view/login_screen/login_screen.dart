import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logintask/constant/color_constant.dart';
import 'package:logintask/constant/size_data.dart';
import 'package:logintask/constant/text_style_constant.dart';
import 'package:logintask/controller/login/login_controller.dart';
import 'package:logintask/controller/login/login_state.dart';
import 'package:logintask/helper/validation.dart';
import 'package:logintask/view/register_screen/register_screeen.dart';
import 'package:logintask/widget/alert.dart';
import 'package:logintask/widget/app_button.dart';
import 'package:logintask/widget/app_text_feild.dart';
import 'package:logintask/widget/logo_view.dart';
import 'package:sizer/sizer.dart';

import '../../widget/hint.dart';
import '../../widget/social_widget.dart';
import '../home/home_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
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
                        Text(
                          "Login",
                          style: TextStyleConstant.headLineText(context),
                        ),
                        const HintWidget(),
                        const LogoView(),
                        AppTextField(
                            hint: "",
                            inputType: TextInputType.emailAddress,
                            controller: LoginCubit.get(context).emailController,
                            label: "E-mail",
                            validation: Validation.emailValidationResult),
                        SizedBox(
                          height: 3.h,
                        ),
                        AppTextField(
                            hint: "",
                            inputType: TextInputType.visiblePassword,
                            controller:
                                LoginCubit.get(context).passwordController,
                            password: true,
                            label: "Password",
                            validation: Validation.passwordValidationResult),
                        SizedBox(
                          height: 8.h,
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                            builder: (context, state) {
                          return AppButton(
                              color: ColorConstant.mainColor,
                              textStyle: TextStyleConstant.buttonText(context),
                              title: "Login",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).login(context);
                                }
                              });
                        }, listener: (context, state) {
                          if (state is LoginStateSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                        token:
                                            "${LoginCubit.get(context).loginResponseModel.token}")));
                          } else if (state is LoginStateError) {
                            DataErrorAlert.showError(
                                data: LoginCubit.get(context).errorModel.error!,
                                context: context);
                          }
                        }),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: SizeDataConstant.customWidth(context, 1.1),
                          height: 2.h,
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));
                                      },
                                      child: Text(
                                        "don't have account? register",
                                        style:
                                            TextStyleConstant.bodyText(context),
                                      ))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Social Login",
                          style: TextStyleConstant.headLineText(context),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),

                        ///  Google Login
                        const SocialWidget(),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
