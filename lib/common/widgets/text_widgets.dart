import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class Text24Normal extends StatelessWidget {
  const Text24Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.normal});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 24.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text16Normal extends StatelessWidget {
  const Text16Normal({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;

  final TextAlign? textAlign;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 16.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  const Text10Normal({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 10.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  const Text11Normal({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 11.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text13Normal extends StatelessWidget {
  const Text13Normal({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 13.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  const Text14Normal({
    super.key,
    required this.text,
    this.wrap = false,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.primaryText,
  });
  final String text;
  final bool wrap;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      softWrap: wrap,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 14.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class FadeText extends StatelessWidget {
  const FadeText({
    super.key,
    required this.text,
    this.fontSize = 10,
    this.color = AppColors.primaryText,
  });
  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.fade,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget textUnderline({String text = 'Your text'}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
      ),
    ),
  );
}
