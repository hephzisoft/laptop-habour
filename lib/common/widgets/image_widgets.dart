import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/image_constant.dart';



class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage(
      {super.key,
      this.imagePath = ImageRes.defaultImg,
      this.width = 16,
      this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
      width: width.w,
      height: height.h,
    );
  }
}

Widget AppImageWithColor(
    {String imagePath = ImageRes.defaultImg,
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryText}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
