import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
