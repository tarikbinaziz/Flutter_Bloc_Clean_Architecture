import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean/services/splash/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  initState() {
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.homeScreen);
              },
              child: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
