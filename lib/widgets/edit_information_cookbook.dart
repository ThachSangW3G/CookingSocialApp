

import 'dart:async';
import 'dart:io';

import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/widgets/recipe_intro_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditInformationCookbook extends StatefulWidget {
  const EditInformationCookbook({super.key});

  @override
  State<EditInformationCookbook> createState() => EditInformationCookbookState();
}

class EditInformationCookbookState extends State<EditInformationCookbook> {

  File? _file;
  String? title;
  String? description;

  File? getFile() {
    return _file;
  }

  String? getTitle(){
    return title;
  }

  String? getDescription(){
    return description;
  }

  Future<File> _pickImageFromGallery() async {
    try {
      XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        setState(() {
          _file = file;
        });

        // Thực hiện các thao tác tiếp theo với file...

        return Future.value(file);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
    return Future.value(_file);
  }


  @override
  Widget build(BuildContext context) {
    final cookbookProvider = Provider.of<CookbookProvider>(context);

    // if(_file != null){
    //   cookbookProvider.setImage(_file!);
    //   // print('Sang');
    // }
    return SingleChildScrollView(
        child: Container(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextField(
                decoration: const InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  labelText: 'Title',
                  labelStyle: TextStyle(
                      fontFamily: 'CeraPro',
                      // fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                onChanged: (value){
                  cookbookProvider.setTitle(value);
                },
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
              Stack(
                children: [
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
                      onTap: () async {
                        final fileImage = await _pickImageFromGallery();

                        if(fileImage != null){
                          await cookbookProvider.setImage(fileImage);
                         // print(cookbookProvider.file);
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

                ]
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
                onChanged: (value){
                  cookbookProvider.setDescription(value);
                },
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


