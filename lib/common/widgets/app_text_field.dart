import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'app_shadow.dart';
import 'text_widgets.dart';

Widget appTextField({
  String text = "",
  IconData iconName = IconlyBold.user_2,
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
  TextEditingController? controller,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          //row contains icon and textfield
          child: Row(
            children: [
              //for showing icons
              Container(
                  margin: EdgeInsets.only(left: 17.w, bottom: 5.h),
                  child: Icon(iconName)),
              //our text field
              appTextFieldOnly(
                controller: controller,
                width: 280,
                func: func,
                hintText: hintText,
                obscureText: obscureText,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly(
    {String hintText = "Type your info here",
    double width = 200,
    double height = 50,
    void Function(String value)? func,
    bool obscureText = false,
    TextEditingController? controller}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(
          left: 10.w,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
      controller: controller,
    ),
  );
}
