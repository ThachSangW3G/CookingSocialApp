import 'package:flutter/material.dart';

class YesNoSlider extends StatefulWidget {
  const YesNoSlider({super.key});

  @override
  State<YesNoSlider> createState() => _YesNoSliderState();
}

class _YesNoSliderState extends State<YesNoSlider> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('No'),
        Expanded(
          child: Slider(
            value: _sliderValue,
            min: 0.0,
            max: 1.0,
            divisions: 1,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ),
        const Text('Yes'),
      ],
    );
  }
}