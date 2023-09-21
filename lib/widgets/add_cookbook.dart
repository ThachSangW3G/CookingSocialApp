
import 'dart:io';

import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/widgets/edit_information_cookbook.dart';
import 'package:cooking_social_app/widgets/recipe_item_published_widget.dart';
import 'package:cooking_social_app/widgets/recipe_select_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import '../constants/app_color.dart';

class AddCookbookScreen extends StatefulWidget {
  const AddCookbookScreen({Key? key}) : super(key: key);

  @override
  State<AddCookbookScreen> createState() => _AddCookbookScreenState();
}

class _AddCookbookScreenState extends State<AddCookbookScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;




  Future<void> getDataFromTabs() async {

  }

  Future<String> upLoadFileToFirebase(File file) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      // Tạo tham chiếu đến vị trí lưu trữ trên Firebase Storage
      String fileName = path.basename(file.path);
      Reference ref = storage.ref().child(
          'images/$fileName'); // Thay đổi 'images/image.jpg' thành đường dẫn bạn muốn lưu trữ tệp tin

      // Tải lên tệp tin lên Firebase Storage
      UploadTask uploadTask = ref.putFile(file);

      // Lắng nghe sự kiện tiến trình tải lên
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
      }, onError: (Object e) {
        // Xử lý lỗi nếu có
        //print('Upload error: $e');
      });

      // Đợi cho đến khi quá trình tải lên hoàn thành
      await uploadTask.whenComplete(() {
        //print('Upload complete');
      });

      // Lấy URL của tệp tin đã tải lên
      String downloadURL = await ref.getDownloadURL();
      print('Download URL: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return "https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-1.jpg";
    }
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }


  @override
  Widget build(BuildContext context) {

    final recipeProvider = Provider.of<RecipeProvider>(context);
    final CookbookProvider cookbookProvider = Provider.of<CookbookProvider>(context);
    final recipes = recipeProvider.recipes;

    print(recipes);

    return WillPopScope(
      onWillPop: () async {

        final shouldPop = await _showGobackPopup(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cookbook Form",
            style: TextStyle(
                fontFamily: 'Recoleta',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {

              _showGobackPopup(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () async {
                //await getDataFromTabs();

                // print(cookbookProvider.file);
                final CookBook cookbook = CookBook(
                  id: DateTime.now().toIso8601String(),
                  title: cookbookProvider.title,
                  description: cookbookProvider.description,
                  popularRecipeIndex: 0,
                  image: await upLoadFileToFirebase(cookbookProvider.file!),
                  likes: 0,
                  recipes: recipeProvider.getIdRecipeSelected(),
                  idUser: FirebaseAuth.instance.currentUser!.uid
                );

                cookbookProvider.addCookbook(cookbook);

                Navigator.of(context).pop();
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: AppColors.orangeCrusta,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: AppColors.orangeCrusta,
            ),
            labelColor: AppColors.orangeCrusta,
            labelStyle: const TextStyle(
                fontFamily: 'CeraPro',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: AppColors.greyBombay),
            dividerColor: Colors.white,
            tabs: [
              buildTab(0, 'Intro', 1),
              buildTab(1, 'Recipes', 2),
              buildTab(2, 'Selected', 1),
            ],
          ),
          // systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            EditInformationCookbook(),
            Container(
              child: ListView.builder(
                itemCount: recipeProvider.unSelected.length,
                itemBuilder: (context, index){
                  return RecipeSelect(
                    recipe: recipes[recipeProvider.unSelected[index]],
                    selected: false,
                    select: (){

                      recipeProvider.addSelected(recipeProvider.unSelected[index]);

                    },

                  );
                },
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: recipeProvider.selected.length,
                itemBuilder: (context, index){
                  return RecipeSelect(
                     recipe: recipes[recipeProvider.selected[index]],
                    selected: true,
                    select: (){
                       recipeProvider.removeSelected(recipeProvider.selected[index]);


                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(int index, String text, int type) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
        _tabController.animateTo(index);
      },
      child: Container(
        height: 36,
        width: (type == 1 ? 103 : 120),
        // color: _selectedTabIndex == index ? AppColors.orangeCrusta : null,
        // padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _selectedTabIndex == index
                  ? Colors.white
                  : AppColors.greyBombay,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showGobackPopup(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to go back?'),
          content: const Text('Any changes you made will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancle'),
            ),
          ],
        );
      },
    );
    return shouldPop;
  }
}
