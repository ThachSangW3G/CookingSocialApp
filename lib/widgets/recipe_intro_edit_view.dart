import 'dart:io';
import 'dart:math';

import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

enum Difficulty { Difficult, Medium, Easy }

class RecipeIntroEdit extends StatefulWidget {
  const RecipeIntroEdit({Key? key}) : super(key: key);
  @override
  State<RecipeIntroEdit> createState() => RecipeIntroEditState();
}

class RecipeIntroEditState extends State<RecipeIntroEdit> {
  //Data
  String? _name;
  String? _url;
  int _cookTime = 0;
  String? _description;
  bool? _isPublic = false;
  int? _server;
  //String? _source;
  Difficulty selectedDifficulty = Difficulty.Difficult;
  File? _file;
  //Get data
  String? getName() {
    return _name;
  }

  String? getUrl() {
    return _url;
  }

  int? getCookTime() {
    return _cookTime;
  }

  String? getDescription() {
    return _description;
  }

  String? getDifficult() {
    return selectedDifficulty.name;
  }

  bool? isPublic() {
    return _isPublic;
  }

  int? getServes() {
    return _server;
  }

  File? getFile() {
    return _file;
  }

  Future<void> _pickImageFromGallery() async {
    try {
      XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        setState(() {
          _file = file;
        });
        // Thực hiện các thao tác tiếp theo với file...
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              _name = value;
            },
            decoration: const InputDecoration(
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
                  onChanged: (value) {
                    _cookTime += int.parse(value);
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      labelText: 'minutes',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    _cookTime += int.parse(value) * 60;
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'hours',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),

          // IMAGE -------------------------------------
          const SizedBox(
            height: 24,
          ),
          Stack(children: [
            ClipRRect(
              child: _file != null
                  ? Image.file(
                      _file!,
                      width: MediaQuery.of(context).size.width,
                      height: 208,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/image_background.png',
                      width: MediaQuery.of(context).size.width,
                      height: 208,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: InkWell(
                onTap: _pickImageFromGallery,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icon_svg/pencil.svg',
                    color: Colors.grey[800],
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ),
          ]),

          // DESCRIPTION -------------------------------
          const SizedBox(
            height: 24,
          ),
          TextField(
            onChanged: (value) {
              _description = value;
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                labelText: 'Description',
                labelStyle: TextStyle(
                    fontFamily: 'CeraPro',
                    // fontSize: 14,
                    fontWeight: FontWeight.w400)),
            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
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
                  SizedBox(
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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 8),
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
                  onChanged: (value) {
                    _server = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Serve',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),

          //---------------------
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  const Text(
                    'Publish to Community?',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  Expanded(
                    child: Switch(
                      value: _isPublic!,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isPublic = newValue;
                        });
                      },
                      activeColor: AppColors.orangeCrusta,
                      inactiveTrackColor: AppColors.greyDark,
                      inactiveThumbColor: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )),
            ],
          ),

          //---------------
          const SizedBox(
            height: 24,
          ),
          TextField(
            onChanged: (value) {
              //_source = value;
            },
            decoration: const InputDecoration(
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
          TextField(
            onChanged: (value) {
              _url = value;
            },
            decoration: const InputDecoration(
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
