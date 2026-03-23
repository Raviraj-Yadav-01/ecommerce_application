import 'package:flutter/material.dart';
import '../../features/on_boarding/presentations/ui/login/login_page.dart';
import '../../features/on_boarding/presentations/ui/signup/signup_page.dart';
import '../../features/on_boarding/presentations/ui/splash_page/splash_page.dart';


class AppRoutes {

  static const String splash = "/splash";
  static const String login = "/login";
  static const String signUp = "/signup";

  static Map<String, WidgetBuilder> mRoutes = {

    splash: (context) => SplashPage(),
    login:(context) => LoginPage(),
    signUp:(context) => SignUpPage(),

  };

}