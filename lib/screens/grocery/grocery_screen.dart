import 'package:cooking_social_app/models/ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_color.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery',
          style: TextStyle(
              fontFamily: 'Recoleta',
              fontSize: 20,
              fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SvgPicture.asset(
              'assets/icon_svg/trash.svg',
              width: 24,
              height: 24,
            ),
          )
        ],
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.greyIron,
            width: double.infinity,
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Container(
              height: 48,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: AppColors.greyIron
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add new item',
                    hintStyle: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 17,
                        color: AppColors.greyShuttle
                    ),
                    border: InputBorder.none,


                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            Container(
              height: 1,
              color: AppColors.greyIron,
            ),
            const SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Menu Makan Malam: Sup Makaroni',
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,

                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/icon_svg/chevron-circle-up.svg',
                  height: 24,
                  width: 24,
                  color: AppColors.greyBombay,
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView.builder(
                itemCount: listIngredientItem.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return GroceryItemUncheck(ingredientItem: listIngredientItem[index]);
                },

              ),
            )
          ],
        ),
      ),
    );
  }
}

class GroceryItemUncheck extends StatelessWidget {
  final IngredientItem ingredientItem;
  const GroceryItemUncheck({
    super.key, required this.ingredientItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.greyIron
          )
        )
      ),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyIron
            ),
          ),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Text(
              ingredientItem.title,
              softWrap: true,


              style: const TextStyle(
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}
