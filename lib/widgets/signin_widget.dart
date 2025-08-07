import 'package:flutter/material.dart';

class SigninWidget extends StatelessWidget {
  final String url;
  const SigninWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Color(0xffD6D6D6)),
      ),
      child: Image.asset(url),
    );
  }
}
