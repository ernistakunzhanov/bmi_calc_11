import 'package:bmi_calc_11/constants/decoration/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.child,
    this.bgColor,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: AppDecoration.decorRadius15,
        child: child,
      ),
    );
  }
}
