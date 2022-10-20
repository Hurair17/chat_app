import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashboard_controller.dart';
import '../call_screen.dart';
import '../chat_screen.dart';
import '../contact_screen.dart';
import '../settings_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          color: Theme.of(context).primaryColor,
          index: controller.page.value,
          animationDuration: const Duration(
            milliseconds: 300,
          ),
          onTap: (value) {
            controller.onItemClick(value);
            controller.pageController.jumpToPage(value);
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: const [
            Icon(
              Icons.chat_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.contacts_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.phone_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.settings_rounded,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          ChatListScreen(),
          ContactScreen(),
          CallScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
