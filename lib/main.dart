import 'package:ecommerce_application/core/constants/apps_urls.dart';
import 'package:ecommerce_application/core/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routes/app_routes.dart';
import 'features/dashboard/bloc/cat_bloc.dart';
import 'features/on_boarding/presentations/bloc/user_bloc.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserBloc(apiService: ApiService())),
    BlocProvider(create:(context) => CategoryBloc(apiService: ApiService())),
  ], child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(AppUrls.registration_url);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRoutes,
    );
  }
}

