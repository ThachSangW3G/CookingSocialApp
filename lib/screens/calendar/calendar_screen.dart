import 'package:cooking_social_app/localization/app_localization.dart';
import 'package:cooking_social_app/widgets/calendar_with_recipe_view.dart';
import 'package:cooking_social_app/widgets/my_calendar_new.dart';
import 'package:flutter/material.dart';

import '../../components/add_calendar_item.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarScreenState();

}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localize('calendar'),
          style: const TextStyle(
            fontFamily: 'Recoleta',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            MyNewCalendar(),
            CalendarWithRecipeView(dateTime: DateTime(2023, 27, 8))
          ],
      
        ),
      ),
    );
  }
}
