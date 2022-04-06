// ignore_for_file: non_constant_identifier_names

import 'package:youngeyes/models/news/newsmodel.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsSuccessState extends NewsStates {}

class NewsErrorState extends NewsStates {
  AllNews NewsModel;
  NewsErrorState(this.NewsModel);
}
