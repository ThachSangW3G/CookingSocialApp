import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({super.key});

  
  @override
  State<LanguageSettingScreen> createState() => _LanguageScreenState();

}

class _LanguageScreenState extends State<LanguageSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language Setting', 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Recoleta'
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 20,
          )),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              ElevatedButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Interface Style',
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: AppColors.appPrimaryColor,
                backgroundColor: AppColors.yellowOrange,
                // foregroundColor: AppColors.black,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),      
                fixedSize: Size(MediaQuery.of(context).size.width, 50),     
              ),
              onPressed: () {
                // Navigator.push(context, RouteGenerator.interfacesettingScreen);
              }, 
            ),
            const SizedBox(height: 18,),
            ]
          )
        )
      )
    );
  }
}
