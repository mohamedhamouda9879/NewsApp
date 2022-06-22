import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Y',
                          style: GoogleFonts.abrilFatface(
                              color: Colors.white, fontSize: 45)),
                      Text('0',
        
                          style: GoogleFonts.abrilFatface(
                              color: Color.fromARGB(255, 17, 3, 137),
                              fontSize: 35)),
                      Text('UNG',
                          style: GoogleFonts.abrilFatface(
                              wordSpacing: 3,
                              color: Colors.white,
                              fontSize: 35)),
                      Text(' E',
                          style: GoogleFonts.abrilFatface(
                              color: Color.fromARGB(255, 17, 3, 137),
                              fontSize: 35)),
                      Text('YE',
                          style: GoogleFonts.abrilFatface(
                              color: Colors.white, fontSize: 35)),
                      Text('S',
                          style: GoogleFonts.abrilFatface(
                              color: Colors.white, fontSize: 35)),
                      EasyRichText(
                        "عيون شابة",
                        patternList: [
                          EasyRichTextPattern(
                              targetString: 'عيون شابة', subScript: true),
                        ],
                      ),
                    ],
                  ),
                ),
                backgroundColor: defaultColor,
              ),
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
            ),
          );
        },
      ),
    );
  }
}
