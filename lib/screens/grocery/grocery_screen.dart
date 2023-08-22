



import 'package:cooking_social_app/models/ingredient_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_color.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}



class _GroceryScreenState extends State<GroceryScreen> {

  bool deleted = false;

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
          GestureDetector(
            onTap: () async {
              final bool? delete = await openDialog();

              if(delete == null) return;
              if(delete == true)
                {
                  setState(() {
                    deleted = true;
                  });
                }

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(
                'assets/icon_svg/trash.svg',
                width: 24,
                height: 24,
              ),
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
        child: !deleted ? Column(
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
                const Expanded(
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
        ) : Column(
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
            const SizedBox(height: 40.0,),
            SvgPicture.asset(
              'assets/icon_svg/cart.svg',
              height: 40,
              width: 40,
              color: AppColors.greyBombay,
            ),
            const SizedBox(height: 20.0,),
            const Text(
              'Grocery Empty',
              style: TextStyle(
                fontFamily: 'CeraPro',
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> openDialog() => showDialog<bool>(context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 165,
            child: Column(
              children: [
                const Text(
                  'Are you sure you want to go remove all item?',
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 10.0,),
                const Text(
                  'Any changes you made will be lost.',
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: AppColors.orangeCrusta,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const SizedBox(width: 40.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: AppColors.orangeCrusta,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )

  );
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

class DialogDelete extends StatefulWidget {
  const DialogDelete({super.key});

  @override
  State<DialogDelete> createState() => _DialogDeleteState();
}

class _DialogDeleteState extends State<DialogDelete> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 165,
          child: Column(
            children: [
              const Text(
                'Are you sure you want to go remove all item?',
                style: TextStyle(
                  fontFamily: 'CeraPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 10.0,),
              const Text(
                'Any changes you made will be lost.',
                style: TextStyle(
                  fontFamily: 'CeraPro',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 20,
                        color: AppColors.orangeCrusta,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  const SizedBox(width: 40.0,),
                  const Text(
                    'OK',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 20,
                        color: AppColors.orangeCrusta,
                        fontWeight: FontWeight.w700
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

