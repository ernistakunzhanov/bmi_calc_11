import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GendersWidget extends StatelessWidget {
  const GendersWidget({
    Key? key,
    @required this.icon,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final IconData? icon;
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Column(
          children: [
            FaIcon(
              icon,
              size: 85.0,
            ),
            const SizedBox(height: 10),
            Text(
              text!,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
