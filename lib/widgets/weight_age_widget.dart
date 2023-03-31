import 'package:flutter/material.dart';

class WeightAgeWidget extends StatelessWidget {
  final String? text;
  final String? countText;
  final void Function()? onPlus;
  final void Function()? onMinus;
  const WeightAgeWidget({
    this.text,
    this.countText,
    this.onPlus,
    this.onMinus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text!.toUpperCase(),
            style: const TextStyle(fontSize: 25),
          ),
          Text(
            countText.toString(),
            style: const TextStyle(fontSize: 60),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                // backgroundColor: const Color(0xff0b0e21),
                onPressed: onMinus,

                // style: ElevatedButton.styleFrom(
                //   backgroundColor: const Color(0xff0b0e21),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 15,
                //     vertical: 15,
                //   ),
                // ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                // backgroundColor: const Color(0xff0b0e21),
                onPressed: onPlus,

                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 17,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
