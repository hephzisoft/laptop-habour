import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/routes/routes_constant.dart';
import '../../../common/services/permission_handler.dart';
import '../../../common/utils/constant.dart';
import '../../../common/widgets/popup_messages.dart';
import '../../../global.dart';
import '../../../main.dart';
import '../provider/login_notifier.dart';

class LoginController {
  handleLogin(WidgetRef ref) async {
    var state = ref.watch(loginNotifierProvider);

    var email = state.email;
    var password = state.password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(globalLoaderNotifier.notifier).setLoaderValue(true);

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) {
        toastInfo("User not found");
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email address first !");
        return;
      }
      var user = credential.user;
      if (user != null) {
        var jsonData = json.encode({
          "username": user.displayName,
          "email": user.email,
          "avatar": user.photoURL,
          "uid": user.uid
        });

        Global.storageService.setString(AppConstants.userToken, user.uid);
        Global.storageService.setString(AppConstants.userProfile, jsonData);

        
      } else {
        toastInfo("Login error");
        return;
      }
      await requestNotificationPermission();
      ref.read(globalLoaderNotifier.notifier).setLoaderValue(false);

      navKey.currentState
          ?.pushNamedAndRemoveUntil(AppRouteConstant.home, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("User not found");
      } else if (e.code == 'wrong-password') {
        toastInfo("Your password is wrong");
      } else {
        toastInfo(e.code);
      }
    }
  }

  void handleLogout() {
    Global.storageService.removeString(AppConstants.userToken);
    Global.storageService.removeString(AppConstants.userProfile);
    print(AppConstants.userToken);
    FirebaseAuth.instance.signOut();
    navKey.currentState
        ?.pushNamedAndRemoveUntil(AppRouteConstant.login, (route) => false);
  }
}
