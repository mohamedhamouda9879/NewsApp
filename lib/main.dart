import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/home.dart';
import 'package:youngeyes/modules/login/login.dart';
import 'package:youngeyes/modules/news/news.dart';
import 'package:youngeyes/modules/register/register.dart';
import 'package:youngeyes/shared/bloc_observer.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/network/local/cache_helper.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Widget widget;
  TOKEN = CacheHelper.getData(key: 'token');
  USERID = CacheHelper.getData(key: 'UserID');

  if (TOKEN != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);
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
