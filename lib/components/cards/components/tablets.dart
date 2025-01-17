import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextColorTablet extends StatelessWidget {
  const TextColorTablet({
    super.key,
    required this.title,
    required this.bgColor,
    this.color = Colors.white,
  });

  final String title;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [bgColor, bgColor.withOpacity(.95)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextSmall(
        title: title,
        color: color,
        weight: FontWeight.w500,
      ),
    );
  }
}
