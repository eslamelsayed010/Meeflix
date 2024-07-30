import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/core/widgets/custom_text_form_field.dart';
import 'package:lomaTV/features/edit/data/models/user_model.dart';
import 'package:lomaTV/features/edit/presentation/widgets/custom_profile_image.dart';

class PersonViewBody extends StatefulWidget {
  const PersonViewBody({Key? key}) : super(key: key);

  @override
  State<PersonViewBody> createState() => _PersonViewBodyState();
}

class _PersonViewBodyState extends State<PersonViewBody> {
  String? name, phone;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  UserModel? userModel;
  CollectionReference users =
      FirebaseFirestore.instance.collection(usersCollection);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const CustomProfileImage(),
              const SizedBox(height: 30),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                cursorColor: Colors.white,
                controller: nameController,
                onTap: () {},
                onFieldSubmitted: (data) {
                  nameController!.text = data;
                },
                suffixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                labelText: 'name',
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.white,
                controller: phoneController,
                onTap: () {},
                onFieldSubmitted: (data) {
                  phoneController!.text = data;
                },
                suffixIcon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                labelText: 'phone',
              ),
              const SizedBox(height: 30),
              CustomButon(
                text: 'Update',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
