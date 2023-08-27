import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeCalendarCard extends StatelessWidget {
  final String title;
  final String content;

  const RecipeCalendarCard({Key? key, required this.title, required this.content, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'CeraPro', fontSize: 16, color: AppColors.orangeCrusta),
            ),
            subtitle: Text(
              content, 
              style: const TextStyle(fontFamily: 'CeraPro', fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
              icon: SvgPicture.asset(
                'assets/icon_svg/options.svg',
                height: 24,
                width: 24,
              ),
              onPressed: () {
                // Xử lý sự kiện khi nhấn IconButton
              },
            ),      
          ),
          const Divider(thickness: 1, color: AppColors.greyIron, )
        ],
      ),
    );
  }
}