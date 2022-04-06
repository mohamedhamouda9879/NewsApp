// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/home.dart';
import 'package:youngeyes/models/register/registermodel.dart';
import 'package:youngeyes/modules/register/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class NewsRegisterCubit extends Cubit<NewsRegisterStates> {
  NewsRegisterCubit() : super(NewsRegisterInitialState());

  static NewsRegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? loginModel;

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String RePassword,
      required BuildContext context}) {
    emit(NewsRegisterLoadingState());

    DioHelper.postData(
      Url: "register",
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': RePassword,
      },
    ).then((value) {
      loginModel = RegisterModel.fromJson(value.data);
      print(value.data);
      print('done y bashaaa');

      NavigateAndFinish(context, const HomeScreen());
      emit(NewsRegisterSuccessState(loginModel!));
    }).catchError((error) {
      print('error y hamouda ${error.toString()}');
      showToast(
          message: "The email has already been taken.",
          toastStates: ToastStates.EROOR);
      emit(NewsRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
