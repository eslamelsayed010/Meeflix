// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/firebase_auth_exception_state.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/core/widgets/custom_text_button.dart';
import 'package:lomaTV/core/widgets/custom_text_form_field.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email !';
                    }
                    return null;
                  },
                  labelText: 'Email or phone number',
                  colorText: Colors.grey[350],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The password must contain between 4 and 60 characters !';
                    }
                    return null;
                  },
                  obscure: isPassword,
                  labelText: 'password',
                  colorText: Colors.grey[350],
                  suffixIcon: isPassword
                      ? const Text(
                          'show',
                          style: TextStyle(color: Colors.grey),
                        )
                      : const Text(
                          'hide',
                          style: TextStyle(color: Colors.grey),
                        ),
                  suffixIconPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButon(
                  text: 'sign in',
                  isLoading: isLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      await signInFireBase(context);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  text: 'New to Netflix ? Register now.',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Your login is protected by Google\'s reCAPTCHA service to ensure that you are not a robot. Learn more.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInFireBase(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      // if (credential.user!.emailVerified) {
      //   GoRouter.of(context).push(AppRouter.kSignUpView);
      // } else {
      //   showToast(txt: 'Email Not Verified', state: ToastState.ERROR);
      // }
    } on FirebaseAuthException catch (e) {
      firebaseAuthExceptionState(error: e);
      // if (e.code == 'user-not-found') {
      //   showToast(txt: 'No user found for that email', state: ToastState.ERROR);
      // } else if (e.code == 'wrong-password') {
      //   showToast(txt: 'Wrong password', state: ToastState.ERROR);
      // } else {
      //   showToast(txt: e.toString(), state: ToastState.ERROR);
      // }
    } catch (e) {
      showToast(txt: e.toString(), state: ToastState.ERROR);
      debugPrint(e.toString());
    }
  }
}
