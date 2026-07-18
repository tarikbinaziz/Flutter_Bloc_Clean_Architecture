import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.loginScreen,
        (route) => false,
      ),
    );
  }
}
