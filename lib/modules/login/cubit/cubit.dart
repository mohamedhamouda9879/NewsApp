import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/home.dart';
import 'package:youngeyes/models/login/loginmodel.dart';
import 'package:youngeyes/modules/login/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

import '../../../shared/components/components.dart';

class NewsLoginCubit extends Cubit<NewsLoginStates> {
  NewsLoginCubit() : super(NewsLoginInitialStates());


  static NewsLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? NewsLoginModel;
  void UserLogin(
      {required String email,
      required String password,
      required BuildContext? context}) {
    emit(NewsLoginLoadingStates());
    DioHelper.postData(
      Url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      NewsLoginModel = LoginModel.fromJson(value.data);
      print(value.toString());
      print('hamouda login y basha ');
  
  if(NewsLoginModel!.token!=null){        NavigateAndFinish(context, HomeScreen());
        emit(NewsLoginSucessStates(NewsLoginModel!));}else{
           showToast(message: "Wrong Login", toastStates: ToastStates.EROOR);
          emit(NewsLoginErrorStates('error'));
        }

     
    }).catchError((error) {
      showToast(message: "${error.toString()}", toastStates: ToastStates.EROOR);
      emit(NewsLoginErrorStates(error.toString()));
    });
  }

  

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    print("isPasswordShowen : $isPasswordShowen");
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(NewsChangePasswordVisibilityStates());
  }
}