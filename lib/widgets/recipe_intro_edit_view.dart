import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Difficulty { Difficult, Medium, Easy }

class RecipeIntroEdit extends StatefulWidget {
  const RecipeIntroEdit({super.key});

  @override
  State<RecipeIntroEdit> createState() => _RecipeIntroEditState();

}

class _RecipeIntroEditState extends State<RecipeIntroEdit> {
  Difficulty selectedDifficulty = Difficulty.Difficult;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding:
          const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Title',
              labelStyle: TextStyle(
                  fontFamily: 'CeraPro',
                  // fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),

          // COOK TIME--------------------------------------------
          const SizedBox(height: 24),
          const Text(
            'Cooking Time',
            style: TextStyle(
                fontFamily: 'CeraPro',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0.0),
                      labelText: 'minutes',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 0.0),
                    labelText: 'hours',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ],
          ),

          // IMAGE -------------------------------------
          const SizedBox(
            height: 24,
          ),
          ClipRRect(
            child: Image.asset(
              'assets/images/defaut_food.png',
              width: MediaQuery.of(context).size.width,
              height: 208,
              fit: BoxFit.cover,
            ),
          ),

          // DESCRIPTION -------------------------------
          const SizedBox(
            height: 24,
          ),
          TextField(
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                labelText: 'Description',
                labelStyle: TextStyle(
                    fontFamily: 'CeraPro',
                    // fontSize: 14,
                    fontWeight: FontWeight.w400)),
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter
            ],
            maxLines: null, // Cho phép hiển thị nhiều dòng văn bản
            keyboardType:
                TextInputType.multiline, // Bàn phím hiển thị dạng đa dòng
            textInputAction: TextInputAction.newline,
          ),

          //-------------------------------------------
          const SizedBox(
            height: 24,
          ),

          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Difficulty'),
                  Container(
                    width: 160,
                    child: DropdownButton<Difficulty>(
                      value: selectedDifficulty,

                      // style: const TextStyle(
                      // fontFamily: 'CeraPro',
                      // fontSize: 16,
                      // fontWeight: FontWeight.w400
                      // ),
                      underline: const Divider(
                        thickness: 1.5,
                        color: AppColors.greyBombay,
                      ),
                      isExpanded: true,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(top: 8),
                      icon: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          'assets/icon_svg/chevron-circle-down.svg',
                          height: 15,
                          width: 8,
                        ),
                      ),
                      onChanged: (Difficulty? value) {
                        setState(() {
                          selectedDifficulty = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<Difficulty>(
                          value: Difficulty.Easy,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Easy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.right)),
                        ),
                        DropdownMenuItem<Difficulty>(
                          value: Difficulty.Medium,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Medium',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.right)),
                        ),
                        DropdownMenuItem<Difficulty>(
                          value: Difficulty.Difficult,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Difficult',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.right)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              // const SizedBox(
              //   width: 16,
              // ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 0.0),
                    labelText: 'Serve',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ],
          ),

          //---------------------
          const SizedBox(
            height: 24,
          ),
          const Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Text(
                    'Publish to Community?',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Expanded(child: YesNoSwitch()),
                  SizedBox(width: 20,)
                ],
              )),
            ],
          ),

          //---------------
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                labelText: 'Source',
                labelStyle: TextStyle(
                    fontFamily: 'CeraPro',
                    // fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),

          //-----------------
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                labelText: 'URL',
                labelStyle: TextStyle(
                    fontFamily: 'CeraPro',
                    // fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    ));
  }
}
