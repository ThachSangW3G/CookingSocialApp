import 'dart:io';

import 'package:cooking_social_app/components/additem_dialog.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/providers/adddata_provider/steps_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/recipe_ingredients_edit_view.dart';
import 'package:cooking_social_app/widgets/recipe_intro_edit_view.dart';
import 'package:cooking_social_app/widgets/recipe_steps_edit_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cooking_social_app/widgets/yes_no_slider.dart';
//import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_svg/flutter_svg.dart';

// enum Choice { A, B, C }

class RecipeEditScreen extends StatefulWidget {
  const RecipeEditScreen({Key? key}) : super(key: key);

  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends State<RecipeEditScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RecipeIntroEditState> tab1Key =
      GlobalKey<RecipeIntroEditState>();
  final GlobalKey<RecipeIngredientsEditState> tab2Key =
      GlobalKey<RecipeIngredientsEditState>();
  final GlobalKey<RecipeStepsEditState> tab3Key =
      GlobalKey<RecipeStepsEditState>();
  String? _name;
  String? _url;
  int? _cookTime;
  String? _description;
  String? _difficult;
  bool? _isPublic;
  int? _server;
  String? _source;
  //List<String>? _steps;

  late TabController _tabController;
  int _selectedTabIndex = 0;

  // Choice selectedChoice = Choice.A;

  void getDataFromTabs() async {
    //get Data tab intro
    String name = tab1Key.currentState?.getName() ?? '';
    String? source = tab1Key.currentState?.getUrl() ?? '';
    int? cookTime = tab1Key.currentState?.getCookTime() ?? 0;
    String? description = tab1Key.currentState?.getDescription() ?? '';
    String? difficult = tab1Key.currentState?.getDifficult() ?? '';
    bool? isPublic = tab1Key.currentState?.isPublic() ?? false;
    int? server = tab1Key.currentState?.getServes() ?? 0;
    File? getFile = tab1Key.currentState?.getFile();
    String? url = await upLoadFileToFirebase(getFile!);
    print(name);
    //print(url);
    print(cookTime);
    print(description);
    print(difficult);
    print(isPublic.toString());
    print(server);
    print(url);
    setState(() {
      _name = name;
      _source = source;
      _cookTime = cookTime;
      _description = description;
      _difficult = difficult;
      _isPublic = isPublic;
      _server = server;
      _url = url;
    });
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipe Form",
          style: TextStyle(
              fontFamily: 'Recoleta',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
          onPressed: () {
            _showGobackPopup(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              getDataFromTabs();
              // Xử lý sự kiện khi người dùng nhấn vào nút
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.orangeCrusta,
                fontSize: 18.0,
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
          //labelColor: AppColors.orangeCrusta,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.greyShuttle,
          labelStyle: const TextStyle(
            fontFamily: 'CeraPro',
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            //color: AppColors.greyBombay),
          ),
          dividerColor: Colors.white,
          tabs: [
            buildTab(0, 'Intro', 1),
            buildTab(1, 'Ingredients', 2),
            buildTab(2, 'Steps', 1),
          ],
        ),
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RecipeIntroEdit(key: tab1Key),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 30),
            child: Stack(children: [
              RecipeIngredientsEdit(
                key: tab2Key,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.orangeCrusta,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(children: [
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'Cách Nấu Ăn',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  RecipeStepsEdit(
                    key: tab3Key,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddItemDialog(
                              onAddItem: (itemName) {
                                Provider.of<StepsProvider>(context,
                                        listen: false)
                                    .addNewItem(itemName);
                                Navigator.pop(context);
                              },
                            );
                          });
                      // Xử lý khi nút được nhấn
                    },
                    backgroundColor: AppColors.orangeCrusta,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ]),
          ),
        ],
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
      child: SizedBox(
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

  void _showGobackPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to go back?'),
          content: const Text('Any changes you made will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                //Navigator.pushNamed(context, RouteGenerator.home);
              },
              child: const Text('OK',
                  style: TextStyle(color: AppColors.orangeCrusta)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.orangeCrusta),
              ),
            ),
          ],
        );
      },
    );
  }
}
