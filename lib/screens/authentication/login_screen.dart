import 'package:cooking_social_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_1.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(

            margin: const EdgeInsets.only(top: 200),
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
                color: Colors.white),
            child:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Column(children: [
                const Text('Mallika',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5
                  ),

                ),
                const Text('Everyone can be a chef',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                IntlPhoneField(

                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    focusColor: Colors.grey,

                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      letterSpacing: 1.0
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.orangeCrusta),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  languageCode: "en",
                  onChanged: (phone) {
                    //print(phone.completeNumber);
                  },
                  // onCountryChanged: (country) {
                  //   print('Country changed to: ' + country.name);
                  // },
                ),
                const SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.orangeCrusta,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),

                  ),
                  child: const Center(
                      child: Text('Send OTP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1.2
                      ),
                      )
                  ),
                ),
                const SizedBox(height: 20.0,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.greyBombay,
                        indent: 30,
                        endIndent: 10,
                        thickness: 2,
                      ),
                    ),
                    Text('OR',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 1.3,
                        color: AppColors.greyBombay
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.greyBombay,
                        indent: 10,
                        endIndent: 30,
                        thickness: 2,
                      ),
                    ),


                  ],

                ),
                const SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    border: Border.all(
                      color: AppColors.greyBombay,
                      width: 1
                    )
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage('assets/icons/apple_icon.png'),
                          //   fit: BoxFit.cover,
                          // )
                        ),
                        child: const Image(

                          image: AssetImage('assets/icons/apple_icon.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Text('Continue with Apple',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                letterSpacing: 1.0
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              color: AppColors.greyBombay,
                              width: 1
                          )
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 10),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage('assets/icons/apple_icon.png'),
                              //   fit: BoxFit.cover,
                              // )
                            ),
                            child: const Image(

                              image: AssetImage('assets/icons/facebook_icon.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const Text('Facebook',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    letterSpacing: 1.0
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(
                                color: AppColors.greyBombay,
                                width: 1
                            )
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 10),
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage('assets/icons/apple_icon.png'),
                                //   fit: BoxFit.cover,
                                // )
                              ),
                              child: const Image(

                                image: AssetImage('assets/icons/google_icon.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: const Text('Google',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      letterSpacing: 1.0
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0,),
                const Text(
                  "By continuing, you agree to our",
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0
                          )
                        )
                      ),
                      child: const Text(
                        "Terms of Service",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text(
                        '·',
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2.0
                              )
                          )
                      ),
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text(
                        '·',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2.0
                              )
                          )
                      ),
                      child: const Text(
                        "Content Policy",

                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
