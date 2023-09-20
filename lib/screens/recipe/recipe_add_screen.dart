import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class RecipeAddScreen extends StatefulWidget {
  const RecipeAddScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RecipeAddState();
}

// Hàm kiểm tra giá trị nhập vào có phải là URL hay không
bool isURL(String value) {
  // Biểu thức chính quy để kiểm tra URL
  final urlPattern = RegExp(
    r'^(http(s)?:\/\/)?'
    r'(([a-zA-Z0-9\-])+(\.)?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?'
    r'(:[0-9]+)?(\/([\w#!:.?+=&%@!\-\/])*)?$',
  );

  return urlPattern.hasMatch(value);
}

class _RecipeAddState extends State<RecipeAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Recipe',
          style: TextStyle(
            fontFamily: 'Recoleta',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 1,
              color: AppColors.greyIron,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Import Recipe',
                    style: TextStyle(
                      fontFamily: 'Recoleta',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Paste url from any website that provide recipe',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.23),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'url',
                    style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.greyIron),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelText: '',
                        labelStyle: TextStyle(
                            fontFamily: 'CeraPro',
                            // fontSize: 14,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (!isURL(value)) {
                          // showValidationError(context);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyIron,
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //IMPORT BUTTON
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.orangeCrusta),
                        foregroundColor:
                            MaterialStateProperty.all(AppColors.white)),
                    child: const Text(
                      'IMPORT',
                      style: TextStyle(
                          fontFamily: 'CeraPro',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  //FILLOUT BUTTON
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteGenerator.recipeeditScreen,
                        );
                        //check value ở link url có hợp lệ chưa bằng hàm showValidationError
                      },
                      child: const Text(
                        'or Fill out recipe form',
                        style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.orangeCrusta),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showValidationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lỗi'),
          content: Text('Giá trị nhập vào không phải là URL hợp lệ.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
