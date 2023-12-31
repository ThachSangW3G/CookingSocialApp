import 'package:cooking_social_app/blocs/blocs/login_bloc.dart';
import 'package:cooking_social_app/blocs/states/login_state.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/providers/provider_authentication/authentication_state.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../blocs/blocs/authentication_bloc.dart';
import '../../blocs/events/authentication_event.dart';
import '../../blocs/events/login_event.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  //final AuthService _authService;

  //const LoginScreen({super.key, required AuthService authService}): assert(authService != null), _authService = authService;

  @override
  State<SignUpEmailScreen> createState() {
    return _SignUpEmailScreenState();
  }
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var numberPhone = "";

  bool _obscureText = true;

  bool loading = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationStateProvider authenticationStateProvider =
    Provider.of<AuthenticationStateProvider>(context, listen: false);

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
                      topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Column(children: [
                    const Text(
                      'Mallika',
                      style: TextStyle(
                          fontFamily: 'Recoleta',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    const Text(
                      'Everyone can be a chef',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'CeraPro'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child:  TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_rounded),
                          labelText: 'Name',
                          focusColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontSize: 18, color: Colors.grey, letterSpacing: 1.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.orangeCrusta),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    Container(
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          focusColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontSize: 18, color: Colors.grey, letterSpacing: 1.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.orangeCrusta),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration:  InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(!_obscureText ? Icons.remove_red_eye : Icons.visibility_off)),
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Password',
                          focusColor: Colors.grey,
                          labelStyle: const TextStyle(
                              fontSize: 18, color: Colors.grey, letterSpacing: 1.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.orangeCrusta),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),



                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });

                        if(await authenticationStateProvider.createUserWithEmailAndPassword(_emailController.text, _passwordController.text, _nameController.text)){
                          setState(() {
                            loading = false;
                          });
                          Navigator.pop(context);
                        }


                        //Navigator.pushNamed(context, RouteGenerator.splash);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(color: AppColors.orangeCrusta,)
                        ),
                        child:  Center(
                            child: loading ? const CircularProgressIndicator() : const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.orangeCrusta,
                                  letterSpacing: 1.2,
                                  fontFamily: 'CeraPro'),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 60,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(15.0)),
                    //       border:
                    //           Border.all(color: AppColors.greyBombay, width: 1)),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         margin: const EdgeInsets.symmetric(horizontal: 20),
                    //         height: 30,
                    //         width: 30,
                    //         decoration: const BoxDecoration(
                    //             // image: DecorationImage(
                    //             //   image: AssetImage('assets/icons/apple_icon.png'),
                    //             //   fit: BoxFit.cover,
                    //             // )
                    //             ),
                    //         child: const Image(
                    //           image: AssetImage('assets/icons/apple_icon.png'),
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    //           child: const Text(
                    //             'Continue with Apple',
                    //             style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.black,
                    //                 fontFamily: 'CeraPro',
                    //                 letterSpacing: 1.0),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "By continuing, you agree to our",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, fontFamily: 'CeraPro'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(color: Colors.black, width: 1.0))),
                          child: const Text(
                            "Terms of Service",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'CeraPro'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            '·',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(color: Colors.black, width: 1.0))),
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'CeraPro'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            '·',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(color: Colors.black, width: 1.0))),
                          child: const Text(
                            "Content Policy",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'CeraPro'),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            )
          ],
        ));
  }
}
