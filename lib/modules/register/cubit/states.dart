import 'package:youngeyes/models/register/registermodel.dart';

abstract class NewsRegisterStates {}

class NewsRegisterInitialState extends NewsRegisterStates {}

class NewsRegisterLoadingState extends NewsRegisterStates {}

class NewsRegisterSuccessState extends NewsRegisterStates {
  final RegisterModel registerModel;

  NewsRegisterSuccessState(this.registerModel);
}

class NewsRegisterErrorState extends NewsRegisterStates {
  final String error;

  NewsRegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends NewsRegisterStates {}
