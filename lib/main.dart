import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logintask/controller/login/login_controller.dart';
import 'package:logintask/controller/rigister/rigister_controller.dart';
import 'package:sizer/sizer.dart';

import 'controller/google_login/google_cubit.dart';
import 'view/initial/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),  RepositoryProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),RepositoryProvider<GoogleServiceCubit>(
          create: (context) => GoogleServiceCubit(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

