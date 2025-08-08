import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/firebase/repository.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';
import 'package:grocceryplus/widgets/signin_widget.dart';

class ForgotPassMainScreen extends StatefulWidget {
  ForgotPassMainScreen({super.key});

  @override
  State<ForgotPassMainScreen> createState() => _ForgotPassMainScreenState();
}

class _ForgotPassMainScreenState extends State<ForgotPassMainScreen> {
  final repo = Repository();

  User? _currentUser;

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ActionButtonWidget(
        onPress: () async {
          if (_emailController.text.isNotEmpty) {
            Get.dialog(ProgressIndicatorWidget());
            try {
              repo.Passreset(email: _emailController.text.trim());
              Get.back();
              Get.snackbar(
                'Code Send Successfully',
                'password reset code is sent to your email successfully, pls check the spam folder or all mails',
              );
              Get.toNamed('/login_page');
            } catch (e) {
              print(e);
              Get.snackbar('Error', 'Exception Occurred');
            }
          } else {
            Get.snackbar(
              'Fields are empty',
              'Kindly fill all the fields before Submitting',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        ButtonText: "Finish, Good to go",
        icon: Icons.arrow_forward_ios,
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Forgot Password ?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),

                  Text(
                    "Enter your email address and we'll send you confirmation code to reset your password",
                    style: TextStyle(
                      color: ConstColor.mediumBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 10),

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
