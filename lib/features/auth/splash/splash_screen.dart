import 'package:flutter/material.dart';

import '../../../core/helpers/assets.dart';
import '../../../core/theming/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: ColorsManger.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Heart
            Center(
              child: Image.asset(
                Assets.splashHeart,
                height: height * 0.25,
                width: width * 0.25,
                fit: BoxFit.contain,
              ),
            ),

            // Fifth Circles
            Positioned(
              bottom: height * 0.08,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  Assets.splashFifthDots,
                  height: height * 0.05,
                  width: width * 0.4,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
