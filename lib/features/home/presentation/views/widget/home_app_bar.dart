// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/assets.dart';

import '../../../../../core/widgets/show_toast.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logoImage,
            width: 90,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kPersonView);
            },
            icon: const Icon(Icons.person_2_outlined),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              GoRouter.of(context).pushReplacement(AppRouter.kGetStart);
              showToast(txt: 'signed out!', state: ToastState.ERROR);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
