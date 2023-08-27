import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class ReViewScreen extends StatefulWidget {
  const ReViewScreen({super.key});

  @override
  State<ReViewScreen> createState() => _ReViewScreenState();
}

class _ReViewScreenState extends State<ReViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
      body: ListView(shrinkWrap: true, reverse: true, children: const <Widget>[
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
        CommentItem(
            name: 'Renata Moeloek',
            time: '4 day ago',
            content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
            check: false),
      ]),
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
                  onChanged: (value) {},
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
              onTap: () {},
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
