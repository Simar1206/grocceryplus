import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/firebase/repository.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/signin_widget.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final Repository repo = Repository();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isVisble = false;

  final _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(elevation: 0),

      bottomSheet: ActionButtonWidget(
        onPress: () async {
          if (_emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            try {
              final result = await repo.Login(
                email: _emailController.text,
                password: _passwordController.text,
              );

              if (result.FirebaseResult) {
                Get.snackbar(
                  'Login Successfull',
                  'User Authenticated Successfully',
                );
                Get.toNamed('/home_page');
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
            LottieBuilder.network(
              'https://lottie.host/6800f629-4b0a-4256-89c2-70a7aedcbbd1/Wjk5CLxQno.json',
            ),
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

                      hint: Text('Password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ConstColor.normalBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  //* divider
                  //divider
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Color(0xff878787))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SigninWidget(url: "assets/images/googleicon.png"),
                      SizedBox(width: 20),
                      SigninWidget(url: "assets/images/appleicon.png"),
                      SizedBox(width: 20),
                      SigninWidget(url: "assets/images/facebookicon.png"),
                      SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 32),
                  //*register for user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
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
                        child: Text(
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
                  SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
