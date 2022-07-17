import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/homeLayoutCubit/cubit.dart';
import 'package:social_application/cubits/loginCubit/cubit.dart';
import 'package:social_application/network/cache_helper.dart';
import 'package:social_application/network/end_points.dart';
import 'package:social_application/network/themes.dart';
import 'package:social_application/screens/home_layout/homeLayout.dart';
import 'package:social_application/screens/login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget startWidget;
  var userID = CacheHelper.getData(key: "userID");
  if (userID != null) {
    startWidget = HomeLayout();
  } else {
    startWidget = const LoginScreen();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key,widget:widget);
  Widget widget;

  MyApp(this.widget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginCubit()),
          BlocProvider(
              create: (BuildContext context) =>
                  HomeLayoutCubit()..getUserData()),
        ],
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
        ));
  }
}
