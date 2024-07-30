// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/firebase_auth_exception_state.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/core/widgets/custom_text_form_field.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Are you ready to watch ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your email to create an account or log in to an account.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                isWightThem: true,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email !';
                  }
                  return null;
                },
                colorText: Colors.black,
                labelText: 'E-mail',
                isFilled: false,
                drawBorder: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                isWightThem: true,
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The password must contain between 4 and 60 characters !';
                  }
                  return null;
                },
                colorText: Colors.black,
                obscure: isPassword,
                isFilled: false,
                labelText: 'password',
                suffixIcon: isPassword
                    ? const Text(
                        'show',
                        style: TextStyle(color: Colors.black),
                      )
                    : const Text(
                        'hide',
                        style: TextStyle(color: Colors.black),
                      ),
                suffixIconPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                drawBorder: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButon(
                text: 'Start',
                radius: 0,
                withBorder: false,
                background: Colors.red,
                isLoading: isLoading,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    await signUpFireBase(context);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUpFireBase(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      showToast(txt: 'Send Email Verification', state: ToastState.SUCCESS);
      GoRouter.of(context).push(AppRouter.kSignInView);
    } on FirebaseAuthException catch (e) {
      firebaseAuthExceptionState(error: e);
      // if (e.code == 'weak-password') {
      //   showToast(txt: 'The password is too weak', state: ToastState.ERROR);
      // } else if (e.code == 'email-already-in-use') {
      //   showToast(
      //       txt: 'The account already exists for that email',
      //       state: ToastState.ERROR);
      // }
    } catch (e) {
      showToast(txt: e.toString(), state: ToastState.ERROR);
      debugPrint(e.toString());
    }
  }
}
