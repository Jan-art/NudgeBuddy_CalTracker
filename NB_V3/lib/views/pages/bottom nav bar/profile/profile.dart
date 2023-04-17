import 'package:NudgeBuddy/constants/colors.dart';
import 'package:NudgeBuddy/controllers/auth.dart';
import 'package:NudgeBuddy/models/activity.dart';
import 'package:NudgeBuddy/models/goals.dart';
import 'package:NudgeBuddy/utils/size_config.dart';
import 'package:NudgeBuddy/views/dialog/edit_gender.dart';
import 'package:NudgeBuddy/views/dialog/edit_password.dart';
import 'package:NudgeBuddy/views/pages/bottom%20nav%20bar/profile/components/edit_goal.dart';
import 'package:NudgeBuddy/views/pages/bottom%20nav%20bar/profile/components/options.dart';
import 'package:NudgeBuddy/views/pages/edit%20profile/edit_profile.dart';
import 'package:NudgeBuddy/views/pages/settings/settings.dart';
import 'package:NudgeBuddy/views/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/num_slider.dart';
import 'components/button.dart';

// ProfilePage class renders the profile page of the app with the user's profile information and options to edit their profile
// ==================================================================================================================================================================
class ProfilePage extends GetWidget<AuthController> {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Profile'),
        actions: [
          TextButton(
              onPressed: () => controller.onSignout(),
              child: const Text('Logout'))
        ],
      ),
      body: Center(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 5),
                CircleAvatar(
                  radius: SizeConfig.widthMultiplier * 12,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                    size: 40,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Text(
                  '@${controller.userInfo.username}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.textMultiplier * 2.2),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),

                ProfileOptions(
                    title: 'Email',
                    subtitle: controller.userInfo.email!,
                    onTap: () {}),
                ProfileOptions(
                    title: 'Password',
                    subtitle: '*******',
                    onTap: () => Get.dialog(EditPasswordDialog())),

                ///
                CustomProfileButton(
                  onTap: () => Get.to(() => const EditProfile()),
                  text: 'Edit Personal info',
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                CustomProfileButton(
                  onTap: () => Get.to(() => const SettingsPage()),
                  text: 'Settings',
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                CustomProfileButton(
                  onTap: () => Get.dialog(ConfirmationDialog(
                      text: 'are you sure you want to delete your account?',
                      onConfirm: () => controller.deleteAccount())),
                  text: 'Delete Account',
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),

                CustomProfileButton(
                  onTap: () => _launchUrl('https://flutter.dev'),
                  text: 'Privacy',
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                CustomProfileButton(
                  onTap: () => _launchUrl('https://flutter.dev'),
                  text: 'Contact us',
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 14)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
