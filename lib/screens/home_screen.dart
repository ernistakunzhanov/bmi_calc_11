import 'package:bmi_calc_11/bmi_brain/bmi_brain.dart';
import 'package:bmi_calc_11/constants/colors/app_colors.dart';
import 'package:bmi_calc_11/constants/text_styles/app_text_styles.dart';
import 'package:bmi_calc_11/screens/result_screen.dart';
import 'package:bmi_calc_11/widgets/custom_card.dart';
import 'package:bmi_calc_11/widgets/custom_main_button.dart';
import 'package:bmi_calc_11/widgets/gender_widget.dart';
import 'package:bmi_calc_11/widgets/height_widget.dart';
import 'package:bmi_calc_11/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color activeColor = Colors.grey;
Color inactiveColor = AppColors.secondaryColor;

enum Gender { MALE, FEMALE, NONE }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _weight = 50;
  int _age = 20;
  double _height = 150;

  // Gender gender = Gender.NONE;

  final male = Gender.MALE;
  final female = Gender.FEMALE;
  final none = Gender.NONE;
  Color _maleSelected = inactiveColor;
  Color _femaleSelected = inactiveColor;
  Gender _gender = Gender.NONE;

  void maleFamale(Gender gender) {
    if (gender == male) {
      _maleSelected = activeColor;
      _femaleSelected = inactiveColor;
    }
    if (gender == female) {
      _femaleSelected = activeColor;
      _maleSelected = inactiveColor;
    }
    setState(() {});
  }

  void countWeight(String userPressed) {
    if (userPressed == 'Minus') {
      _weight--;
    } else {
      _weight++;
    }
    setState(() {});
  }

  void countAge(String userPressed) {
    if (userPressed == 'Minus') {
      _age--;
    } else {
      _age++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0e21),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff0b0e21),
        title: const Center(
          child: Text(
            'Bmi Calculator',
            style: AppTextStyles.white22w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(
                  bgColor: _gender == Gender.MALE ? Colors.grey : Colors.teal,
                  child: GendersWidget(
                    onTap: () {
                      maleFamale(male);
                    },
                    icon: FontAwesomeIcons.mars,
                    text: 'Male',
                  ),
                ),
                const SizedBox(width: 20),
                CustomCard(
                  bgColor: _femaleSelected,
                  child: GendersWidget(
                    onTap: () {
                      maleFamale(female);
                    },
                    icon: FontAwesomeIcons.venus,
                    text: 'FeMale',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomCard(
              bgColor: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: HeightWidget(
                  onChanged: (double userChanged) {
                    _height = userChanged;
                    setState(() {});
                  },
                  sliderValue: _height,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CustomCard(
                  bgColor: Colors.teal,
                  child: WeightAgeWidget(
                    text: 'Weight',
                    countText: _weight.toString(),
                    onMinus: () => countWeight('Minus'),
                    onPlus: () => countWeight('Plus'),
                  ),
                ),
                const SizedBox(width: 20),
                CustomCard(
                  bgColor: Colors.teal,
                  child: WeightAgeWidget(
                    text: 'Age',
                    countText: _age.toString(),
                    onMinus: () => countAge('Minus'),
                    onPlus: () => countAge('Plus'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomMainButton(
        buttonText: 'Calculate'.toUpperCase(),
        onPressed: () {
          bmiBrain.calculateBmi(weight: _weight, height: _height);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                        bmiResult: bmiBrain.calculateBmi(
                            weight: _weight, height: _height),
                      )));
        },
      ),
    );
  }
}
