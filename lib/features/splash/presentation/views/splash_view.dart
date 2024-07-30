import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/assets.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    delayedWidgetAppearance();
    navToSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(AssetsData.animationSplashScreen),
            Visibility(
              visible: isVisible,
              child: CircularProgressIndicator(
                color: ColorManager.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  void delayedWidgetAppearance() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  void navToSignIn() {
    Future.delayed(
      const Duration(seconds: 5),
      () => GoRouter.of(context).pushReplacement(
        FirebaseAuth.instance.currentUser != null
            ? AppRouter.kHomeView
            : AppRouter.kGetStart,
      ),
    );
  }
}
