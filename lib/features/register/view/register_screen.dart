import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:laptop_habour/common/global_loader/global_loader.dart';

import '../../../common/routes/routes_constant.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_button_widgets.dart';
import '../../../common/widgets/app_text_field.dart';
import '../../../common/widgets/text_widgets.dart';
import '../controller/register_controller.dart';
import '../provider/register_notifier.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;
  late final RegisterController _controller;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    _controller = RegisterController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(name: 'Register'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // more login options
                // Username login
                appTextField(
                  text: 'Username',
                  iconName: IconlyBold.user_3,
                  // func: (value) => ref
                  //     .watch(signInNotifier Provider.notifier)
                  //     .onUserEmailChange(value),
                  hintText: 'Enter your username',
                  controller: _userController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Email text box
                appTextField(
                  text: 'Email',
                  iconName: IconlyBold.message,
                  // func: (value) => ref
                  //     .watch(signInNotifier Provider.notifier)
                  //     .onUserEmailChange(value),
                  hintText: 'Enter your email',
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                // password text box
                appTextField(
                    text: 'Password',
                    // func: (value) => ref
                    //     .watch(signInNotifierProvider.notifier)
                    //     .onUserPasswordChange(value),
                    iconName: IconlyBold.password,
                    hintText: 'Enter your password',
                    obscureText: true,
                    controller: _passwordController),

                SizedBox(
                  height: 100.h,
                ),
                // app login button
                Center(
                  child: ref.watch(globalLoaderNotifier) == true
                      ? const CircularProgressIndicator()
                      : AppButton(
                          isLogin: true,
                          width: 325,
                          buttonName: 'Register',
                          onPressed: () {
                            ref
                                .read(registerNotifierProvider.notifier)
                                .onUserEmailChange(_emailController.text);
                            ref
                                .read(registerNotifierProvider.notifier)
                                .onUserPasswordChange(_passwordController.text);
                            ref
                                .read(registerNotifierProvider.notifier)
                                .onUsernameChange(_userController.text);
                            _controller.handleRegister(ref);
                          },
                        ),
                ),
                // app signup button
                SizedBox(
                  height: 20.h,
                ),
                // app login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text14Normal(
                      text: 'Already have an account?',
                    ),
                    AppButton(
                      buttonName: 'Login',
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(AppRouteConstant.login),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
