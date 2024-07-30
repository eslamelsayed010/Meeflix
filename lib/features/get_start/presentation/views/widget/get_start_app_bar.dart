import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/assets.dart';

class GetStartAppBar extends StatelessWidget {
  const GetStartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logoImage,
            width: 120,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Privacy',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            child: const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignInView);
            },
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 22,
                color: Colors.grey[400],
              )),
        ],
      ),
    );
  }
}
