



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controller/google_login/google_cubit.dart';
import '../repository/google_service.dart';
import '../controller/google_login/google_state.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<GoogleServiceCubit,GoogleServiceState>(
        builder: (context, state) {
          return Material(
            child: InkWell(
              onTap: (){
                GoogleSignService().signInWithGoogle(context);
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xffde5246),
                child: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is GoogleServiceStateSuccess){

          }
        });
  }
}
