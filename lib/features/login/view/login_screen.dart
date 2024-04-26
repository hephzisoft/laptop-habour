import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/routes/routes_constant.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_button_widgets.dart';
import '../../../common/widgets/app_text_field.dart';
import '../../../common/widgets/text_widgets.dart';
import '../controller/login_controller.dart';
import '../provider/login_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;

  late final TextEditingController _passwordController;
  late final LoginController _controller;

  @override
  void initState() {
    _emailController = TextEditingController();

    _passwordController = TextEditingController();
    _controller = LoginController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(name: 'Login'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // more login options

                // Email text box
                appTextField(
                  text: 'Email',
                  iconName: IconlyBold.message,
                  hintText: 'Enter your email',
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                // password text box
                appTextField(
                  text: 'Password',
                  iconName: IconlyBold.password,
                  hintText: 'Enter your password',
                  obscureText: true,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: textUnderline(text: 'Forgot Password?'),
                  ),
                ),
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
                          buttonName: 'Login',
                          onPressed: () {
                            ref
                                .read(loginNotifierProvider.notifier)
                                .onUserEmailChange(_emailController.text);
                            ref
                                .read(loginNotifierProvider.notifier)
                                .onUserPasswordChange(_passwordController.text);
                            _controller.handleLogin(ref);
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
                      text: 'Don\'t have an account?',
                    ),
                    AppButton(
                      buttonName: 'Register',
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(AppRouteConstant.register),
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
