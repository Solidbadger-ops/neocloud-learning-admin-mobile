import 'package:flutter/material.dart';
// import 'package:neocloud_mobile/components/cards/class_academic_card.dart';
// import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/screens/faculty/faculty_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

// : (){} "" <> ? _ ! *
class FacultyCard extends StatelessWidget {
  const FacultyCard({
    super.key,
    required this.faculty,
  });

  final FacultyModel faculty;

  @override
  Widget build(BuildContext context) {
    List<String> facultyTitleList = faculty.name.split(" ");
    String smallText = facultyTitleList.length > 1
        ? ' ${facultyTitleList.sublist(
              1,
            ).join(' ')}'
        : '';
    String bigText = facultyTitleList[0];
    // List<Map> tabletData = [
    //   {'count': 'faculty.educatorsCount', 'type': 'Educator', 'color': kOrange},
    //   {'count': 'faculty.classesCount', 'type': 'Class', 'color': kRed},
    //   {'count': 'faculty.studentsCount', 'type': 'Student', 'color': kGreen},
    // ];
    List<Map> tabletData = [
      {'count': 3, 'type': 'Educator', 'color': kOrange},
      {'count': 3, 'type': 'Class', 'color': kRed},
      {'count': 3, 'type': 'Student', 'color': kGreen},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FacultyScreen(faculty: faculty),
              )),
          child: Container(
            padding: screenPadding,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Faculty Title
                const SizedBox(height: 10),
                TextBigSmall(
                  bigText: bigText,
                  smallText: smallText,
                  bigTextSize: 40,
                  bigTextWeight: FontWeight.w200,
                  smallTextSize: 16,
                  smallTextWeight: FontWeight.w600,
                ),

                // Faculty Owner
                const SizedBox(height: 10),
                buildAvatarAndName(
                    avatar: faculty.hod!.avatar ?? 'assets/dps/1.jpg',
                    name: faculty.hod!.name,
                    fontSize: 16,
                    weight: FontWeight.w600),

                // Faculty intro description
                const SizedBox(height: 20),
                TextCustomMaxLine(
                  title: faculty.about ?? 'about not found',
                  color: kBlack70,
                  fontSize: 16,
                  maxLines: 2,
                ),

                // Bottom Tablets
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    tabletData.length,
                    (index) => TextColorTablet(
                      title:
                          '${tabletData[index]['count']} ${getPluralOrSingular(
                        count: tabletData[index]['count'],
                        word: tabletData[index]['type'],
                      )}',
                      bgColor: tabletData[index]['color'],
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        // Dates
      ],
    );
  }
}
