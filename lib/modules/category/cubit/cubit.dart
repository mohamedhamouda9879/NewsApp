// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:youngeyes/models/category/category.dart';
import 'package:youngeyes/modules/category/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categoryModel = [];

  void getCategory(BuildContext context) {
    DioHelper.getData(Url: 'categories').then((value) {
      (value.data as List<dynamic>).forEach(
        (element) {
          var category = CategoryModel.fromJson(element);
          categoryModel.add(category);
        },
      );
      emit(CategorySuccessState());
    }).catchError((error) {
      print(error);
      emit(CategoryErrorState(error));
    });
  }
}
