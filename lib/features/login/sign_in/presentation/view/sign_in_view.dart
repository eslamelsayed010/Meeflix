import 'package:flutter/material.dart';
import 'package:lomaTV/core/utils/assets.dart';
import 'package:lomaTV/features/login/sign_in/presentation/view/widget/sing_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            AssetsData.logoImage,
            width: 100,
          ),
          const SizedBox(width: 10)
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SignInViewBody(),
    );
  }
}
