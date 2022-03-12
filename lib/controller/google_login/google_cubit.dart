


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'google_state.dart';


class GoogleServiceCubit extends Cubit<GoogleServiceState>{
  GoogleServiceCubit() : super(GoogleServiceStateInitial());
  static GoogleServiceCubit get(BuildContext context) => BlocProvider.of(context);



}