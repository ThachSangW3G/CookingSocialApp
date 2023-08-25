import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class TabContentIntro extends StatelessWidget {
  const TabContentIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Mendengar kata-kata Sup pastinya yang terbayang dibenak kita adalah sesuatu yang enak dan lezat. Bagaimana tidak menu makanan yang satu ini adalah salah satu menu yang digemari diseluruh pelosok Indosesia. Makanan yang membuat kita lebih bersemangat untuk makan lebih banyak dari poris biyasanya. Kali ini saya akan sedikti mberikan sedikit informasi bagi ibu-ibu rumah tangga yang hobi akan memasak tentang Sup Makaroni yang mungkin bisa dijadikan salah satu menu masakan spesial untuk keluarga tercinta anda dirumah. Agar pembahasan kita tidak melebar kemana-mana mari kita langsung saja masuk kepembahasan utama kita tentang Sup Makaroni. Silahkan disimak langkah-langkah dibawah ini',
            style: TextStyle(
                color: Colors.black, fontFamily: 'CeraPro', fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Source',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'https://www.fimela.com/lifestyle-relationsh',
            style: TextStyle(
                fontFamily: 'CeraPro',
                fontSize: 16,
                color: AppColors.greyBombay),
          )
        ],
      ),
    );
  }
}
