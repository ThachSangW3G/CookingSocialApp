import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/line_row.dart';
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
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icon_svg/camera.svg',
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                          AppColors.orangeCrusta, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Edit Photo',
                        style: TextStyle(
                            color: AppColors.orangeCrusta,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CeraPro'),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LineRow(),
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
                    style: kLabelTextStyleProfile,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nararaya Kirana',
                    style: kContentTextStyleProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LineRow(),
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
                    style: kLabelTextStyleProfile,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'nararaya.putri@gmail.com',
                    style: kContentTextStyleProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LineRow(),
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
                    style: kLabelTextStyleProfile,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'nararaya.putri@gmail.com',
                    style: kContentTextStyleProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LineRow(),
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
                    style: kLabelTextStyleProfile,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rajin menabung dan suka memasak',
                    style: kContentTextStyleProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LineRow()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: AppColors.orangeCrusta,
                  borderRadius: BorderRadius.circular(7)),
              alignment: Alignment.center,
              child: const Text(
                'Save changes',
                style: TextStyle(
                    fontFamily: 'CeraPro', fontSize: 16, color: Colors.white),
              ),
            ),
          )),
    );
  }
}
