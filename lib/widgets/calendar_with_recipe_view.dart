import 'package:cooking_social_app/widgets/calendar_with_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CalendarWithRecipeView extends StatefulWidget {
  final DateTime dateTime;

  const CalendarWithRecipeView({Key? key, required this.dateTime}) : super(key: key);

  
  
  @override
  State<CalendarWithRecipeView> createState() => _CalendarWithRecipeViewState();

}

class _CalendarWithRecipeViewState extends State<CalendarWithRecipeView> {
  
  @override
  Widget build(BuildContext context) {
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
                  'Sat 27',
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
                        // Xử lý sự kiện khi nhấn IconButton "delete"
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: const [
                RecipeCalendarCard(title: "Breakfast", content: "Bo xao long dua",),
                RecipeCalendarCard(title: "Lunch", content: "Het tien roi, nhin doi!",),
                // Thêm các CustomCardView khác vào đây
              ],
            ),
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
