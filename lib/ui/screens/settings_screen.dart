import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/controllers/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'profileName',
                          child: Obx(
                            () => Text(
                              controller.userModel.value.name == ''
                                  ? 'No name'
                                  : controller.userModel.value.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'View and edit profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: 'profileImage',
                    child: Obx(
                      () => controller.userModel.value.image == ''
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/default.png'),
                              maxRadius: 20,
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  controller.userModel.value.image),
                              maxRadius: 20,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    tileColor: Theme.of(context).disabledColor.withOpacity(0.1),
                    leading: Icon(
                      Icons.language_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text('App Language'),
                    trailing: const Text('English'),
                  ),
                ),
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).disabledColor.withOpacity(0.1),
              leading: Icon(
                Icons.help_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Help'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    tileColor: Theme.of(context).disabledColor.withOpacity(0.1),
                    leading: Icon(
                      Icons.info_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text('About'),
                  ),
                ),
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).disabledColor.withOpacity(0.1),
              leading: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Help'),
            ),
          ],
        ),
      ),
    );
  }
}
