import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean/views/home/home_screen.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: const HomeScreen(),
      // home: const MyHomePagetitle: 'Flutter Demo Home Page'),
    );
  }
}



