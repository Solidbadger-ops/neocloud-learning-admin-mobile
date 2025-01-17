import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';

class ClassScheduleCard extends StatelessWidget {
  const ClassScheduleCard({
    super.key,
    required this.classSchedule,
  });

  final ClassScheduleModel classSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPadding,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Educator {Avatar - Name}
          const SizedBox(height: 20),
          // TODO: use actual educators when a form that connects everything has been used to connect things up
          buildAvatarAndName(
            // avatar: classwork.clas!.educators![0].avatar,
            // name: classwork.clas!.educators![0].name,
            avatar: defaultProfileAvatar,
            name: 'John Default',
            fontSize: 16,
            weight: FontWeight.w600,
          ),

          // Class Title
          const SizedBox(height: 10),
          buildCardHeader(title: classSchedule.title),

          // About
          const SizedBox(height: 15),
          TextSmall(
            title: classSchedule.description ?? '',
            color: kBlack70,
            // weight: FontWeight.w400,
          ),

          // Bottom Tablets
          const SizedBox(height: 20),
          Row(
            children: [
              IconText(
                  title: 'August 12',
                  icon: Icons.calendar_month,
                  iconColor: kBlack70,
                  fontSize: 14),
              const SizedBox(
                width: 20,
              ),
              IconText(
                  title: '9:30 am - 12:30pm',
                  icon: Icons.timer,
                  iconColor: kBlack70,
                  fontSize: 14),
            ],
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
