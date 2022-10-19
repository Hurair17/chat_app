import 'package:chat_app/core/binding/initial_binding.dart';
import 'package:chat_app/ui/screens/dashboard/dashboard.dart';
import 'package:chat_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:chat_app/ui/widgets/appTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(Get.height, Get.width),
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          darkTheme: darkThemeData(context),
          theme: lightThemeData(context),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialBinding: IntialBinding(),
          home: const SplashScreen(),
          getPages: [
            GetPage(
                name: Routes.DASHBOARD, page: () => const DashboardScreen()),
          ],
        );
      },
    );
  }
}

class Routes {
  static const String DASHBOARD = '/dashboard';
}
