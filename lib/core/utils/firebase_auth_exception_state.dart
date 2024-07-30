import 'package:firebase_auth/firebase_auth.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';

firebaseAuthExceptionState({required FirebaseAuthException error}) {
  switch (error.code) {
    case 'invalid-email':
      showToast(txt: 'wrong email', state: ToastState.ERROR);
      break;
    case 'user-disabled':
      showToast(txt: 'user disabled', state: ToastState.ERROR);
      break;
    case 'user-not-found':
      showToast(txt: 'user not found', state: ToastState.ERROR);
      break;
    case 'wrong-password':
      showToast(txt: 'wrong password', state: ToastState.ERROR);
      break;
    case 'email-already-in-use':
      showToast(txt: 'email already in use', state: ToastState.ERROR);
      break;
    case 'operation-not-allowed':
      showToast(txt: 'operation not allowed', state: ToastState.ERROR);
      break;
    case 'weak-password':
      showToast(txt: 'weak password', state: ToastState.ERROR);
      break;
    case 'credential-already-in-use':
      showToast(txt: 'credential already in use', state: ToastState.ERROR);
      break;
    case 'invalid-credential':
      showToast(txt: 'wrong password or email', state: ToastState.ERROR);
      break;
    case 'account-exists-with-different-credential':
      showToast(
          txt: 'account exists with different credential',
          state: ToastState.ERROR);
      break;
    case 'requires-recent-login':
      showToast(txt: 'requires recent login', state: ToastState.ERROR);
      break;
    case 'provider-already-linked':
      showToast(txt: 'provider already linked', state: ToastState.ERROR);
      break;
    case 'no-such-provider':
      showToast(txt: 'no such provider', state: ToastState.ERROR);
      break;
    case 'invalid-verification-code':
      showToast(txt: 'wrong verification code', state: ToastState.ERROR);
      break;
    case 'invalid-verification-id':
      showToast(txt: 'wrong verification id', state: ToastState.ERROR);
      break;
    default:
      showToast(txt: error.code.toString(), state: ToastState.ERROR);
      break;
  }
}
