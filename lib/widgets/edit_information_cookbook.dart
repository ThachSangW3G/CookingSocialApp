import 'package:cooking_social_app/widgets/recipe_intro_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditInformationCookbook extends StatefulWidget {
  const EditInformationCookbook({super.key});

  @override
  State<EditInformationCookbook> createState() => _EditInformationCookbookState();
}

class _EditInformationCookbookState extends State<EditInformationCookbook> {
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
              // IMAGE -------------------------------------
              const SizedBox(
                height: 24,
              ),
              ClipRRect(
                child: Image.asset(
                  'assets/images/defaut_food.png',
                  width: MediaQuery.of(context).size.width,
                  height: 210,
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


              //---------------------
              const SizedBox(
                height: 24,
              ),

            ],
          ),
        ));
  }
}
