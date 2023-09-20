import 'package:cooking_social_app/models/recipe_calendar.dart';
import 'package:cooking_social_app/providers/calendar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../components/add_calendar_item.dart';
import 'calendar_with_recipe_card.dart';

class CalendarWithRecipeView extends StatefulWidget {
  final DateTime dateTime;

  const CalendarWithRecipeView({Key? key, required this.dateTime}) : super(key: key);

  
  
  @override
  State<CalendarWithRecipeView> createState() => _CalendarWithRecipeViewState();

}

class _CalendarWithRecipeViewState extends State<CalendarWithRecipeView> {
  
  @override
  Widget build(BuildContext context) {

    final calendarProvider = Provider.of<CalendarProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // formatDate(widget.dateTime),
                  '${DateFormat.MMMM().format(calendarProvider.dateSelected)} ${calendarProvider.dateSelected.day}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'CeraPro'),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/icon_svg/pencil.svg', height: 24, width: 24,),
                      onPressed: () {
                        // Xử lý sự kiện khi nhấn IconButton "edit"
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/icon_svg/Vector.svg', height: 24, width: 24,),
                      onPressed: () {
                        _showAddRecipeCalendarDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: FutureBuilder<List<RecipeCalendar>>(
              future: calendarProvider.getRecipeCalendar(calendarProvider.dateSelected),
              builder: (context, snapshot){
                print(calendarProvider.dateSelected);

                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else {
                  final calendar = snapshot.data;

                  return ListView.builder(
                    itemCount: calendar!.length,
                    itemBuilder: (context, index){

                      final recipeCalendar = calendar![index];

                      return RecipeCalendarCard(recipeCalendar: recipeCalendar);
                    },
                  );
                }

              }
            )
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    // final weekday = DateFormat.E('vi_VN').format(dateTime);
    final weekday = DateFormat.MMMM().format(dateTime);
    final dayOfMonth = DateFormat.d('vi_VN').format(dateTime);
    return '$weekday, $dayOfMonth';
  }
}


void _showAddRecipeCalendarDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (context){
        return AddCalendarItem();
      }

  );

}