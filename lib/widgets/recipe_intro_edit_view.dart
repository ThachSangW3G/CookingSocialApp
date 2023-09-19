import 'dart:io';
import 'dart:math';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/providers/adddata_provider/intro_provider.dart';
import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum Difficulty { Difficult, Medium, Easy }

class RecipeIntroEdit extends StatefulWidget {
  const RecipeIntroEdit({Key? key}) : super(key: key);
  @override
  State<RecipeIntroEdit> createState() => RecipeIntroEditState();
}

class RecipeIntroEditState extends State<RecipeIntroEdit> {
  //final TextEditingController _textEditingController = TextEditingController();
  //Data
  // String? _name;
  // String? _url;
  // int _cookTime = 0;
  // // String? _description;
  // bool _isPublic = false;
  // // int? _server;
  // // //String? _source;
  // Difficulty selectedDifficulty = Difficulty.Difficult;

  // File? _file;
  //Get data
  // String? getName() {
  //   return _name;
  // }

  // String? getUrl() {
  //   return _url;
  // }

  // int? getCookTime() {
  //   return _cookTime;
  // }

  // String? getDescription() {
  //   return _description;
  // }

  // String? getDifficult() {
  //   return selectedDifficulty.name;
  // }

  // bool? isPublic() {
  //   return _isPublic;
  // }

  // int? getServes() {
  //   return _server;
  // }

  // File? getFile() {
  //   return _file;
  // }

  // Future<void> _pickImageFromGallery() async {
  //   try {
  //     XFile? pickedFile =
  //         await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       File file = File(pickedFile.path);

  //       setState(() {
  //         _file = file;
  //         Provider.of<IntroProvider>(context).updateIntro(file: file);
  //       });
  //       // Thực hiện các thao tác tiếp theo với file...
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final introProvider = Provider.of<IntroProvider>(context);
    final intro = introProvider.intro;
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: intro.name,
            validator: (value) =>
                (value?.isEmpty ?? true) ? 'Title is required' : null,
            onChanged: (value) {
              setState(() {
                introProvider.updateIntro(name: value);
              });
            },
            //controller: _textEditingController,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Title',
              // errorText: _textEditingController.text.isEmpty
              //     ? 'Giá trị không được để trống'
              //     : null,
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
                child: TextFormField(
                  initialValue:
                      intro.cookTime == null ? '' : intro.cookTime.toString(),
                  onChanged: (value) {
                    introProvider.updateIntro(cookTime: int.parse(value));
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
                child: TextFormField(
                  initialValue: intro.cookTimeHour == null
                      ? ''
                      : intro.cookTimeHour.toString(),
                  onChanged: (value) {
                    introProvider.updateIntro(cookTime: int.parse(value));
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      labelText: 'hours',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
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
              child: intro.file != null
                  ? Image.file(
                      intro.file!,
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
                onTap: () async {
                  try {
                    XFile? pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      File file = File(pickedFile.path);
                      introProvider.updateIntro(file: file);
                      // Thực hiện các thao tác tiếp theo với file...
                    }
                  } catch (e) {
                    print('Error picking image: $e');
                  }
                },
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
          TextFormField(
            initialValue: intro.description,
            onChanged: (value) {
              introProvider.updateIntro(description: value);
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
                  const Text(
                    'Difficulty',
                    style: TextStyle(fontFamily: "CeraPro"),
                  ),
                  SizedBox(
                    width: 160,
                    child: DropdownButton<String>(
                      value: intro.difficult,
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
                      onChanged: (String? value) {
                        introProvider.updateIntro(difficult: value);
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Easy",
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Easy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.right)),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Medium',
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Medium',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.right)),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Difficult',
                          child: Align(
                              alignment: Alignment.center,
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
                child: TextFormField(
                  initialValue:
                      intro.server == null ? '' : intro.server.toString(),
                  onChanged: (value) {
                    introProvider.updateIntro(server: int.parse(value));
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
                      value: intro.isPublic!,
                      onChanged: (bool newValue) {
                        introProvider.updateIntro(isPublic: newValue);
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
          TextFormField(
            initialValue: intro.source,
            onChanged: (value) {
              introProvider.updateIntro(source: value);
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
          TextFormField(
            initialValue: intro.url,
            onChanged: (value) {
              introProvider.updateIntro(url: value);
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
