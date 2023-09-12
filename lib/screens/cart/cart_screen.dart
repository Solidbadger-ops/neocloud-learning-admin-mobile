// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/cart_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';

// @RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  static String screenName = 'cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart items
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(coursesList.length,
                  (index) => CartCard(course: coursesList[index])),
            ),

            Divider(color: kBlack50, height: 2),

            // Wishlist items
            const SizedBox(height: 20),
            TextExtraLarge(
              title: "Wishlist",
              color: kBlack80,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  2, (index) => CartCard(course: coursesList[index])),
            ),
          ],
        ),
      ),
    );
  }
}
