import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class YesNoSwitch extends StatefulWidget {
  const YesNoSwitch({super.key});

  @override
  State<YesNoSwitch> createState() => _YesNoSwitchState();
}

class _YesNoSwitchState extends State<YesNoSwitch> {
  bool _result = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        Switch(
          value: _result, 
          onChanged: (bool newValue) {
            setState(() {
              _result = newValue;
            });              
          },
          activeColor: AppColors.orangeCrusta,
          inactiveTrackColor: AppColors.greyDark,
          inactiveThumbColor: AppColors.white,
          
        ),
    ); 
  }
}

