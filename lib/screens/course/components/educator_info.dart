import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
// import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/utils.dart';

class EducatorInfo extends StatelessWidget {
  const EducatorInfo({super.key, required this.user});
  final Account user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextLarge(
          title: "Educator",
          weight: FontWeight.w600,
          color: kBlack80,
        ),

        // Educator gradient card info
        const SizedBox(height: 20),
        EducatorCard(user: user),

        // About Educator
        const SizedBox(height: 20),
        TextSeeMore(text: user.about),
      ],
    );
  }
}

class EducatorCard extends StatelessWidget {
  const EducatorCard({super.key, required this.user});

  final Account user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 200,
      decoration: buildDecoration(),
      child: Row(
        children: <Widget>[
          // Avatar
          const SizedBox(width: 20),
          buildAvatar(),

          // User Info
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  // Users full name
                  buildName(),

                  // Ratings
                  const SizedBox(height: 5),
                  buildRatings(),

                  // Row (reviews & courses)
                  const SizedBox(height: 15),
                  buildReviesCoursesCount(),

                  // Students
                  const SizedBox(height: 5),
                  buildStudentsCount(),

                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildStudentsCount() {
    return TextMedium(
      title:
          "${user.students_count} ${getPluralOrSingular(count: user.students_count, word: 'student')}",
      color: kWhite,
    );
  }

  Widget buildReviesCoursesCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // {count} reviews
        TextMedium(
          title:
              "${user.reviews_count} ${getPluralOrSingular(count: user.reviews_count, word: 'review')}",
          color: kWhite,
        ),

        // {count} courses
        TextMedium(
          title:
              "${user.reviews_count} ${getPluralOrSingular(count: user.courses_count, word: 'course')}",
          color: kWhite,
        ),
      ],
    );
  }

  Widget buildRatings() {
    return Ratings(
      rating: user.ratings,
      reviewsCount: user.reviews_count,
      fontSize: 15,
      iconSize: 20,
      color: kWhite,
      showReviews: false,
    );
  }

  Widget buildName() {
    return TextExtraLarge(
      title: user.fullName,
      weight: FontWeight.w600,
      color: kWhite,
    );
  }

  Widget buildAvatar() {
    return RoundBoxAvatar(
      size: 110,
      borderSize: 0.35,
      image: user.avatar,
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [kBlue, kBlueLight],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
