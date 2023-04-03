import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/profile_section.dart';
import 'package:neocloud_mobile/screens/dashboard/components/title_count_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Section 1 - Attendance, Events
          SizedBox(height: defaultSize * 2),
          buildSectionOne(),

          // Section 2 - Students, Educators, Admin
          SizedBox(height: defaultSize * 3),
          buildSectionTwo(context)
        ],
      ),
    );
  }

  Container buildSectionOne() {
    return Container(
      padding: screenPadding,
      child: Column(
        children: [
          TitleCountSection(
            title: 'Todays Attendance',
            count: '0',
            press: (context) => navigateToComingSoon(context: context),
          ),
          SizedBox(height: defaultSize * 1),
          TitleCountSection(
            title: 'Recent Events',
            count: '0',
            press: (context) => navigateToComingSoon(context: context),
          ),
        ],
      ),
    );
  }

  Container buildSectionTwo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: defaultSize * 12),
      // Background
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultSize * 3),
        ),
      ),

      // List the users
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListProfileSection(
            title: 'Students',
            data: users,
          ),
          ListProfileSection(
            title: 'Educators',
            data: users,
          ),
          ListProfileSection(
            title: 'Admin',
            data: users,
          ),
        ],
      ),
    );
  }

}