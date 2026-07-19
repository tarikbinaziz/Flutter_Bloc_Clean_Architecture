import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean/repository/auth/login_repo.dart';
import 'package:flutter_bloc_clean/views/home/home_screen.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const HomeScreen(),
      // home: const MyHomePagetitle: 'Flutter Demo Home Page'),
    );
  }
}


void servicesLocator() {
  getIt.registerLazySingleton(() => LoginRepo());
}