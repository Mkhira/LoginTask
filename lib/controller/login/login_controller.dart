




import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logintask/animation/loader.dart';
import 'package:logintask/model/error_model.dart';
import 'package:logintask/model/login_model.dart';
import 'package:logintask/model/login_resposne_model.dart';
import 'package:logintask/repository/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginStateInitial());


  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginResponseModel loginResponseModel = LoginResponseModel();
  ErrorModel errorModel = ErrorModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(BuildContext context)async{
    emit(LoginStateLoading());
    Loader.showLoader(context);
    UserModel loginModel = UserModel();
    loginModel.password = passwordController.text;
    loginModel.email = emailController.text;
    try {
      Response response = await LoginRepo.loginApi(context: context, loginModel: loginModel);

      if(response.statusCode == 200){
        loginResponseModel = LoginResponseModel.fromJson(response.data);
        emailController.clear();
        passwordController.clear();
        Loader.hideLoader(context);
        emit(LoginStateSuccess());
      }else if(response.statusCode == 400){
          errorModel = ErrorModel.fromJson(response.data);
        Loader.hideLoader(context);
        emit(LoginStateError());
      }
    } on Exception catch (e) {
      Loader.hideLoader(context);
    emit(LoginStateFail());
    }

  }


}