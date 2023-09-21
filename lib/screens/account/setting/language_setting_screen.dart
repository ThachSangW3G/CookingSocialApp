import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/providers/provider_language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              RadioListTile(
              title: const Text('English'),              
              value: const Locale('en'),
              groupValue: context.watch<LanguageProvider>().currentLocale,
              onChanged: (value) {
                final languageProvider = context.read<LanguageProvider>();
                languageProvider.setLocale(value as Locale);
              }, 
            ),
              RadioListTile(
                title: const Text('Vietnamese'),
                value: const Locale('vi'),
                groupValue: context.watch<LanguageProvider>().currentLocale,
                onChanged: (value) {
                  final languageProvider = context.read<LanguageProvider>();
                  languageProvider.setLocale(value as Locale);
                },
              )
            ]
          )
        )
      )
    );
  }
}
