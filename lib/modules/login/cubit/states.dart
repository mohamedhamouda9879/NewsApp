// ignore_for_file: non_constant_identifier_names

import 'package:youngeyes/models/login/loginmodel.dart';

abstract class NewsLoginStates {}

class NewsLoginInitialStates extends NewsLoginStates {}

class NewsLoginLoadingStates extends NewsLoginStates {}

class NewsLoginSucessStates extends NewsLoginStates {
  LoginModel NewsLoginModel;

  NewsLoginSucessStates(this.NewsLoginModel);
}

class NewsLoginErrorStates extends NewsLoginStates {
  final String error;
  NewsLoginErrorStates(this.error);
}

class NewsChangePasswordVisibilityStates extends NewsLoginStates {}
