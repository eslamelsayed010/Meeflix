import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';

void userState() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
      showToast(txt: 'signed out!', state: ToastState.ERROR);
    } else {
      debugPrint('User is signed in!');
      showToast(txt: 'signed in!', state: ToastState.SUCCESS);
    }
  });
}
