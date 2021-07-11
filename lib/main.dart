import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_movie_app/pages/home_page.dart';
import 'package:student_movie_app/pages/movie_home_page.dart';
import 'package:student_movie_app/persistence/hive_constants.dart';

import 'data/models/lgoin_model.dart';
import 'data/models/login_model_impl.dart';
import 'data/vos/movie_vo.dart';
import 'data/vos/userInfo_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserInfoVoAdapter());
  Hive.registerAdapter(MovieVoAdapter());

  await Hive.openBox<UserInfoVo>(BOX_NAME_USERINFO_VO);

  await Hive.openBox<String>(BOX_NAME_TOKEN_VO);

  await Hive.openBox<MovieVo>(BOX_NAME_MOVIE_VO);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoginModel mLoginModel = LoginModelImpl();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Colors.white,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: mLoginModel.isUserLogin() ? MovieHomePage() : HomePage(),
      //home: HomePage(),

      //home: HomePage(),
    );
  }
}

