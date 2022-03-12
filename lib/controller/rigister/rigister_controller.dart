



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logintask/animation/loader.dart';
import 'package:logintask/controller/rigister/rigister_state.dart';
import 'package:logintask/model/error_model.dart';
import 'package:logintask/model/login_model.dart';
import 'package:logintask/repository/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterStateInitial());


  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  ErrorModel errorModel = ErrorModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> register(BuildContext context)async{
    emit(RegisterStateLoading());
    Loader.showLoader(context);
    UserModel loginModel = UserModel();
    loginModel.password = passwordController.text;
    loginModel.email = emailController.text;
    try {
      Response response = await RegisterRepo.registerApi(context: context, userModel: loginModel);

      if(response.statusCode == 200){
        emailController.clear();
        passwordController.clear();
        Loader.hideLoader(context);
        emit(RegisterStateSuccess());
      }else if(response.statusCode == 400){
        errorModel = ErrorModel.fromJson(response.data);
        Loader.hideLoader(context);
        emit(RegisterStateError());
      }
    } on Exception catch (e) {
      Loader.hideLoader(context);
      emit(RegisterStateFail());
    }

  }


}