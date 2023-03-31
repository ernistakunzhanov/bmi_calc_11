import 'package:bmi_calc_11/bmi_brain/bmi_brain.dart';
import 'package:bmi_calc_11/widgets/custom_card.dart';
import 'package:bmi_calc_11/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    @required this.bmiResult,
    Key? key,
  }) : super(key: key);

  final double? bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.9,
          child: CustomCard(
            bgColor: Color(0xff24263B),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  bmiBrain.getResult(bmiResult!),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmiResult!.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    bmiBrain.getInterpretation(bmiResult!),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomMainButton(
        buttonText: "Re-Calculate",
        onPressed: () {},
      ),
    );
  }
}
