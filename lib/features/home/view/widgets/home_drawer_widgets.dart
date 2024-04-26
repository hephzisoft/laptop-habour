import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/routes_constant.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../login/controller/login_controller.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({
    super.key,
  });

  final drawerItem = [
    {
      "route": AppRouteConstant.cart,
      "title": "Cart",
      "icon": Icons.shopping_cart,
    },
    {
      "route": AppRouteConstant.wishlist,
      "title": "Wishlist",
      "icon": Icons.favorite,
    },
    {
      "route": AppRouteConstant.order,
      "title": "Orders",
      "icon": Icons.shopping_bag,
    },
    {
      "route": AppRouteConstant.profile,
      "title": "Profile",
      "icon": Icons.person,
    },
    {
      "route": AppRouteConstant.feedback,
      "title": "Feedback",
      "icon": Icons.feedback,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              // color: primaryColor,
              child: ListTile(
                trailing: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(
                        CupertinoIcons.clear_circled,
                        size: 30.w,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Scaffold.of(context).closeEndDrawer();
                      },
                    );
                  },
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawerItem.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    drawerItem[index]['route'] as String,
                  );
                },
                child: Container(
                  height: 50.h,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Icon(
                        drawerItem[index]['icon'] as IconData,
                        // color: primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text14Normal(
                          text: drawerItem[index]['title'] as String,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w),
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                label: const Text14Normal(text: 'Logout'),
                onPressed: () {
                  LoginController().handleLogout();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
