import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laptop_habour/common/global_loader/global_loader.dart';
import 'package:laptop_habour/features/register/provider/register_notifier.dart';

import '../../../common/routes/routes_constant.dart';
import '../../../common/widgets/popup_messages.dart';

class RegisterController {
  void handleRegister(WidgetRef ref) async {
    var state = ref.watch(registerNotifierProvider);

    var email = state.email;
    var password = state.password;
    var username = state.username;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(globalLoaderNotifier.notifier).setLoaderValue(true);
    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        String photoUrl = "assets/images/profile.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            'An email has been sent to verify your account. Please open that email to verify');
        ref.read(globalLoaderNotifier.notifier).setLoaderValue(false);
        context.pushReplacementNamed(AppRouteConstant.login);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('This email has been registered');
      }else{
        toastInfo(e.code);
      }
    }
  }
}
