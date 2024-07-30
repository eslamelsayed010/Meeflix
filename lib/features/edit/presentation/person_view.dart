import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/features/edit/presentation/widgets/person_view_body.dart';

class PersonView extends StatelessWidget {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const PersonViewBody(),
    );
  }
}
