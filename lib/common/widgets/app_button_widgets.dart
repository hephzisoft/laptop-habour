import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'text_widgets.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final bool isLogin;
  final BuildContext? context;
  final void Function()? onPressed;
  const AppButton({
    super.key,
    this.width = 100,
    this.height = 50,
    this.buttonName = "",
    this.isLogin = false,
    this.context,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: isLogin ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        //isLogin true then send primary color else send white color

        child: Center(
          child: Text16Normal(
            text: buttonName,
            color: isLogin ? AppColors.primaryText : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
