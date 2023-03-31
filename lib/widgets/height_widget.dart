import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({
    Key? key,
    this.sliderValue,
    this.onChanged,
  }) : super(key: key);

  final double? sliderValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HEIGHT'.toUpperCase(),
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              sliderValue!.toStringAsFixed(0),

              //  sliderValue.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
            const SizedBox(width: 3),
            const Text(
              'cm',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.white,
            overlayColor: const Color(0x29EB1555),
            thumbColor: Colors.red,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
          ),
          child: Slider(
            value: sliderValue!,
            min: 0,
            max: 220,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
