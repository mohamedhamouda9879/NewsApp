// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/home.dart';
import 'package:youngeyes/modules/login/login.dart';
import 'package:youngeyes/modules/video/video.dart';
import 'package:youngeyes/shared/bloc_observer.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/network/local/cache_helper.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  TOKEN = CacheHelper.getData(key: 'token');
  USERID = CacheHelper.getData(key: 'UserID');

  if (TOKEN != null) {
    widget = const HomeScreen();
  } else {
    widget = LoginScreen();
  }
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
      //home: NewsScreen(),
    );
  }
}
