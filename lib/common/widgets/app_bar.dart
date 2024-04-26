import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'text_widgets.dart';

AppBar buildAppBar({String name = ''}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(
      text: name,
      color: AppColors.primaryText,
    ),
    centerTitle: true,
  );
}

AppBar buildGlobalAppbar({String title = ""}) {
  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText,),
  );
}
