import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';
import 'common/theme/app_theme.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final navKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: "Laptop Habour",
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            navigatorKey: navKey,
            onGenerateRoute: AppRoutes.generateRouteSettings,
          );
        });
  }
}
