import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:cooking_social_app/providers/like_provider.dart';
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
  final TextEditingController _textEditingController = TextEditingController();
  String? keyRecipe;
  String? _description;
  @override
  void initState() {
    keyRecipe = widget.keyRecipe;
    //context.read<ReviewStateProvider>().fetchReview(keyRecipe!);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   context.read<ReviewStateProvider>().fetchReview(keyRecipe!);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final ReviewStateProvider reviewProvider =
        Provider.of<ReviewStateProvider>(context);
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
      body: Scaffold(
        body: FutureBuilder<List<Review>>(
          future: reviewProvider.fetchReview(keyRecipe!),
          builder: (context, snapshot) {
            final listReview = snapshot.data;
            return listReview == null
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listReview.length,
                      itemBuilder: (context, index) {
                        return CommentItem(review: listReview[index]);
                      },
                    ),
                  );
          },
        ),
      ),
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
                  controller: _textEditingController,
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
              onTap: () async {
                if (_description != null) {
                  reviewProvider.addReview(_description!, keyRecipe!);
                  _textEditingController.clear();
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
