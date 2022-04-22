import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/cubit/cubit.dart';
import 'package:youngeyes/layouts/cubit/states.dart';
import 'package:youngeyes/modules/category/cubit/cubit.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  return Scaffold(
    //   //  body: Center(child: defaultButton(function: (){
    //   //    SignOut(context);
    //   //  }, text: 'Sign OUT'))
    //  );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(
            create: (context) => CategoryCubit()..getCategory(context)),
        // BlocProvider(create: (context) => ProfileCubit()..getProfile(USERID!)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: defaultColor,
              index: cubit.currentIndex,
              items: const <Widget>[
                Icon(
                  Icons.home,
                  size: 30,
                ),
                Icon(
                  Icons.favorite,
                  size: 30,
                ),
                Icon(
                  Icons.person,
                  size: 30,
                ),
              ],
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
            ),
          );
        },
      ),
    );
  }
}
