import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/providers/provider_recipe/review_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/app_color.dart';

class ReViewScreen extends StatefulWidget {
  final String keyRecipe;
  const ReViewScreen({super.key, required this.keyRecipe});

  @override
  State<ReViewScreen> createState() => _ReViewScreenState();
}

class _ReViewScreenState extends State<ReViewScreen> {
  String? keyRecipe;
  String? _description;
  @override
  void initState() {
    keyRecipe = widget.keyRecipe;
    context.read<ReviewStateProvider>().fetchReview(keyRecipe!);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   context.read<ReviewStateProvider>().fetchReview(keyRecipe!);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Reviews',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Recoleta'),
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
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(16.0), child: LineRow()),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<ReviewStateProvider>(builder: (context, provider, _) {
        return Padding(
            padding: const EdgeInsets.all(0),
            child: provider.review.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<ReviewStateProvider>()
                          .fetchReview(keyRecipe!);
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.review.length,
                      itemBuilder: (context, index) {
                        return CommentItem(review: provider.review[index]);
                      },
                    ),
                    // child: ListView.builder(itemBuilder: itemBuilder),
                    // child: ListView(shrinkWrap: true, reverse: true, children: const <Widget>[
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    // CommentItem(
                    //     name: 'Renata Moeloek',
                    //     time: '4 day ago',
                    //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
                    //     check: false),
                    //]),
                  ));
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.greyBombay))),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whitePorcelain),
                child: TextField(
                  onChanged: (value) {
                    _description = value;
                  },
                  onTap: () {},
                  decoration: const InputDecoration(
                    hintText: 'Your Review',
                    hintStyle: TextStyle(
                        color: AppColors.greyShuttle,
                        fontFamily: 'CeraPro',
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                if (_description != null) {
                  addReview(_description!, keyRecipe!);
                }
              },
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                    color: AppColors.orangeCrusta,
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void addReview(String description, String keyRecipe) async {
  // Khởi tạo Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Tạo một document reference và lấy ra ID ngẫu nhiên
    DocumentReference reviewRef = firestore.collection('reviews').doc();

    // Tạo một map chứa thông tin review
    Map<String, dynamic> reviewData = {
      'uidUser':
          FirebaseAuth.instance.currentUser?.uid, // Giá trị uidUser (String)
      'time': Timestamp.now(), // Giá trị time (Timestamp)
      'key': reviewRef.id, // Giá trị key (String)
      'keyRecipe': keyRecipe,
      'description': description
    };

    // Thêm review vào Firestore
    await reviewRef.set(reviewData);

    if (kDebugMode) {
      print('Review added successfully!');
    }
  } catch (error) {
    if (kDebugMode) {
      print('Error adding review: $error');
    }
  }
}
