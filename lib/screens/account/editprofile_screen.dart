import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitePorcelain,
        centerTitle: true,
        title: const Text(
          'Edit ProFile',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Recoleta'),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
      ),
      backgroundColor: AppColors.whitePorcelain,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/avatar.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera_outlined),
                    color: AppColors.orangeCrusta,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Edit Photo',
                        style: TextStyle(
                            color: AppColors.orangeCrusta,
                            fontFamily: 'CeraPro'),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Name',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nararaya Kirana',
                    style: kReviewLabelTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'nararaya.putri@gmail.com',
                    style: kReviewLabelTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'nararaya.putri@gmail.com',
                    style: kReviewLabelTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rajin menabung dan suka memasak',
                    style: kReviewLabelTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.orangeCrusta),
          onPressed: () {},
          child: const Center(
            child: Text(
              'Save Changes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
