import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/utils.dart';

class BackOfficeScreen extends StatelessWidget {
  const BackOfficeScreen({Key? key}) : super(key: key);
  static String screenName = "Back Office";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: false,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: Container(
        color: Colors.red,
        child: TextMedium(title: screenName, color: Colors.white),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
