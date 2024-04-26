import 'package:flutter/material.dart';

import '../../features/cart/view/cart_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/order/view/order_screen.dart';
import '../../features/product_detail/view/product_details_screen.dart';
import '../../features/product_detail/view/widgets/review_form.dart';
import '../../features/register/view/register_screen.dart';
import '../../features/wishlist/view/wish_list_screen.dart';
import '../../global.dart';
import 'routes_constant.dart';

class AppRoutes {
  static List<RouteEntities> routes() {
    return [
      RouteEntities(
        path: AppRouteConstant.login,
        page: const LoginScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.register,
        page: const RegisterScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.home,
        page: const HomeScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.productDetails,
        page: const ProductDetailsScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.cart,
        page: const CartScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.productReview,
        page: const ReviewForm(),
      ),
      RouteEntities(
        path: AppRouteConstant.wishlist,
        page: const WishlistScreen(),
      ),
      RouteEntities(
        path: AppRouteConstant.order,
        page: const OrderScreen(),
      ),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        if (result.first.path == AppRouteConstant.login) {
          bool isLogin = Global.storageService.isLoggedIn();

          if (isLogin) {
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const LoginScreen(),
              settings: settings,
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: settings,
    );
  }
}

class RouteEntities {
  String path;
  Widget page;

  RouteEntities({required this.path, required this.page});
}
