import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/Profile/components/star_rating.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/course/components/course_outline.dart';
import 'package:neocloud_mobile/screens/course/components/course_perks.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';
import 'package:intl/intl.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key, required this.course}) : super(key: key);
  static String screenName = "Course";

  final Course course;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.currency(symbol: '');
    return Scaffold(
      appBar: buildAppBar(
        title: "",
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        actionIcon: Icons.shopping_cart_outlined,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image
            SizedBox(height: defaultSize),
            Padding(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image
                  buildCourseImage(),

                  // Title
                  SizedBox(height: defaultSize * 1.5),
                  buildCourseTitle(),

                  // Ratings
                  SizedBox(height: defaultSize),
                  buildCourseRatings(),

                  // Created by ....
                  SizedBox(height: defaultSize * .8),
                  buildCreatedBy(),

                  // Students count & reviews
                  SizedBox(height: defaultSize * .8),
                  buildStudentsCountAndReviews(),

                  // Duration
                  SizedBox(height: defaultSize * .8),
                  buildDuration(),

                  // Cost
                  SizedBox(height: defaultSize * 1.8),
                  buildCourseCost(formatter),

                  // Buy Btn & Cart Btn
                  SizedBox(height: defaultSize * 1.8),
                  buildBuyCartButton(),

                  // What You'll Learn
                  CoursePerks(
                      title: "What you'll learn",
                      list: course.accomplishments ?? ['Loading']),

                  // Requirements
                  CoursePerks(
                      title: "Requirements",
                      list: course.requirements ?? ['Loading']),

                  // Course Outline
                  SizedBox(height: defaultSize * 3),
                  CourseOutline(modules: modulesList),

                  // About Educator

                  // Reviews

                  // Similar Courses
                ],
              ),
            ),
            pageBottomPadding()
          ],
        ),
      ),
    );
  }

  Widget buildBuyCartButton() {
    return Row(
      children: <Widget>[
        // Buy now
        Expanded(
            flex: 5,
            child: AppsButton(
                title: "Buy now",
                padTopBottom: defaultSize * .6,
                press: (context) => {})),
        // Cart
        SizedBox(width: defaultSize),
        Expanded(
            child: AppsIconButton(
          press: (BuildContext? context) {},
          icon: Icons.add_shopping_cart_outlined,
          iconColor: kBlack70,
          padTopBottom: defaultSize * 1.5,
          bgColor: kBlack.withOpacity(.05),
        ))
      ],
    );
  }

  Widget buildCourseCost(NumberFormat formatter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // TextCustom(title: "${formatter.format(course.price)}", fontSize: defaultSize * 3, weight: FontWeight.w700, color: kBlack80,)
        IconText(
          svg: "assets/icons/naira_symbol.svg",
          title: "${formatter.format(course.price)}",
          fontSize: defaultSize * 2.5,
          fontWeight: FontWeight.w600,
          color: kBlack80,
          iconColor: kBlack80,
        )
      ],
    );
  }

  Widget buildDuration() {
    return IconText(
      icon: Icons.phone_android,
      title:
          "${course.duration} ${getPluralOrSingular(count: course.duration, word: 'hour')} on demand",
      fontSize: defaultSize * 1.6,
      color: kBlack70,
      iconColor: kBlack70,
    );
  }

  Widget buildStudentsCountAndReviews() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Students
        IconText(
          svg: 'assets/icons/account.svg',
          title:
              "${course.students_count} ${getPluralOrSingular(count: course.students_count, word: 'student')}",
          fontSize: defaultSize * 1.6,
          color: kBlack70,
          iconColor: kBlack70,
        ),

        // Reviews in Percentage
        course.reviews_count != 0
            ? AppsTextRich(
                text1:
                    "${((course.reviews_count / course.students_count) * 100).toInt()}% ",
                text2: "left a review",
                text1Color: kGreen,
                text2Color: kBlack70,
                text1FontSize: defaultSize * 1.6,
                text2FontSize: defaultSize * 1.6,
                text1FontWeight: FontWeight.w600,
              )
            : TextMedium(title: "No reviews yet"),
      ],
    );
  }

  Widget buildCreatedBy() {
    return AppsTextRich(
      text1: "created by ",
      text2: "${course.user.fullName}",
      text1Color: kBlack50,
      text2Color: kBlue,
      text1FontSize: defaultSize * 1.6,
      text2FontSize: defaultSize * 1.6,
      text2FontWeight: FontWeight.w600,
    );
  }

  Widget buildCourseRatings() {
    return Row(
      children: <Widget>[
        // Rating
        TextMedium(
            title: "${course.rating / 20}",
            color: kBlack80,
            weight: FontWeight.w600),

        // Stars
        SizedBox(width: defaultSize * .5),
        StarRating(rating: course.rating, iconSize: defaultSize * 2.4),

        // Reviews Count
        SizedBox(width: defaultSize * .5),
        TextMedium(
            title:
                "(${course.reviews_count} ${getPluralOrSingular(count: course.reviews_count, word: 'review')})",
            color: kBlack50)
      ],
    );
  }

  Widget buildCourseImage() {
    return Container(
      height: SizeConfig.screenWidth! / 1.8,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(course.imgSrc), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildCourseTitle() {
    return TextCustom(
        title: course.title,
        weight: FontWeight.w700,
        color: kBlack90,
        fontSize: defaultSize * 2.2);
  }
}

