import 'package:youngeyes/models/category/category.dart';

abstract class CategoryStates {}

class CategoryInitialState extends CategoryStates {}

class CategorySuccessState extends CategoryStates {}

class CategoryErrorState extends CategoryStates {
  CategoryModel categoryModel;
  CategoryErrorState(this.categoryModel);
}
