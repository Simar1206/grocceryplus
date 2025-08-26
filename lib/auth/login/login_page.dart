import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/firebase/repository.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';
import 'package:grocceryplus/widgets/signin_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final Repository repo = Repository();

  //*bool obj for remeber me
  bool rememberMe = false;

  //function to loadCredentials
  void LoadRemeberMeCredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('saved_email');
    String? savedPassword = prefs.getString('saved_password');

    bool? savedrememberMe = prefs.getBool('saved_rememberMe') ?? false;

    if (savedrememberMe) {
      setState(() {
        rememberMe = true;
        _passwordController.text = savedPassword ?? '';
        _emailController.text = savedEmail ?? '';
      });
    }
  }

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isVisble = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    //*init the loadrememberMe function
    LoadRemeberMeCredential();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      appBar: AppBar(elevation: 0),

      bottomSheet: ActionButtonWidget(
        onPress: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();

          if (_emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            Get.dialog(ProgressIndicatorWidget(), barrierDismissible: false);
            try {
              final result = await repo.Login(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );
              Get.back();

              if (result.FirebaseResult) {
                Get.snackbar(
                  'Login Successfull',
                  'User Authenticated Successfully',
                );
                Get.toNamed('/home_page');
                //*added the logic
                if (rememberMe) {
                  await pref.setBool('saved_rememberMe', true);
                  await pref.setString(
                    'saved_password',
                    _passwordController.text,
                  );
                  await pref.setString('saved_email', _emailController.text);
                } else {
                  await pref.remove('saved_password');
                  await pref.remove('saved_email');
                  await pref.setBool('saved_rememberMe', false);
                }
              } else {
                Get.snackbar('Logic Unsuccessful', 'try again later');
              }
            } catch (e) {
              Get.snackbar('Authentication Unsuccessful', 'Exception Caught');
            }
          }
        },
        ButtonText: 'Next',
        icon: Icons.arrow_forward_ios,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Image.asset('assets/images/mobilepic.png'),
            // LottieBuilder.network(
            //   'https://lottie.host/6800f629-4b0a-4256-89c2-70a7aedcbbd1/Wjk5CLxQno.json',
            // ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),

                  Text(
                    'Email Address',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: Color(0xff37474F)),
                  ),

                  const SizedBox(height: 10),

                  TextFieldWidget(
                    TextHidden: false,
                    controller: _emailController,
                    hintText: 'Email Address',
                    icon: null,
                  ),

                  const SizedBox(height: 28),

                  Text(
                    'Password ',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: Color(0xff37474F)),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    obscureText: !isVisble,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisble = !isVisble;
                          });
                        },
                        child: isVisble == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      filled: true,
                      fillColor: ConstColor.TextfieldBackground,

                      hint: const Text('Password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ConstColor.normalBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //*forgot pass:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //*RemeberME logic:
                      Row(
                        children: [
                          Checkbox(
                            activeColor: ConstColor.AccentColor,
                            checkColor: ConstColor.WhiteColor,
                            value: rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Text('Remember Me'),
                        ],
                      ),
                      //*forgot pass
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/forgot_pass_main_screen',
                          );
                        },
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ConstColor.AccentColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  //* divider
                  //divider
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Color(0xff878787))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or Sign in With",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff878787),
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xff878787))),
                    ],
                  ),

                  //sizedbox
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SigninWidget(
                        url: "assets/images/googleicon.png",
                        onPress: () async {
                          try {
                            final result = await repo.SignInWithGoogle();
                            if (result.FirebaseResult) {
                              Get.snackbar(
                                'Authnetication Successful',
                                'Google sign in was successful',
                              );
                            } else {
                              Get.snackbar('Authnetication Failed', '');
                            }
                          } catch (e) {
                            Get.snackbar(
                              'Error',
                              'Failed to sign in with Google',
                            );
                          }
                        },
                      ),
                      const SizedBox(width: 20),
                      SigninWidget(
                        url: "assets/images/appleicon.png",
                        onPress: () {
                          print('called apple');
                        },
                      ),
                      const SizedBox(width: 20),
                      SigninWidget(
                        url: "assets/images/facebookicon.png",
                        onPress: () {
                          print('called facebook');
                        },
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 32),
                  //*register for user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register_page');
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ConstColor.AccentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 50),
                  //sizedbox
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//*************** WIDGETS ********** WIDGETS ************* WIDGETS ****** WIDGETS ****************** WIDGETS ******** WIDGETS *********** WIDGETS ******* WIDGETS ************ WIDGETS ************* WIDGETS ******** WIDGETS ********* WIDGETS *********** WIDGETS ************* WIDGETS ********* WIDGETS ******************************************************************************************************************************** */

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool TextHidden;
  final String hintText;
  final IconData? icon;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.TextHidden,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: TextHidden,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon),
        filled: true,
        fillColor: ConstColor.TextfieldBackground,

        hint: Text(hintText),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: ConstColor.normalBlack,
        ),
      ),
    );
  }
}
