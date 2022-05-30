import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/cubit/states.dart';
import 'package:youngeyes/modules/category/category.dart';
import 'package:youngeyes/modules/favourites/favourites.dart';
import 'package:youngeyes/modules/profile/profile.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    CategoriesScreen(),
    const FavouritesScreen(),
    const TopViewdScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
