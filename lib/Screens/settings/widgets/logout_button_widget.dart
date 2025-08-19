import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class LogoutButtonWidget extends StatefulWidget {
  const LogoutButtonWidget({super.key});

  @override
  State<LogoutButtonWidget> createState() => _LogoutButtonWidgetState();
}

class _LogoutButtonWidgetState extends State<LogoutButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = true;
        });
        print('Logout button Cliked');

        Future.delayed(Duration(milliseconds: 1000),() {
          if(mounted) {
            setState(() {
              _isPressed = false;
            });
          }
        });
      },
      child: AnimatedContainer(
      
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        
        decoration: BoxDecoration(
          color: _isPressed ? Colors.red : ConstColor.WhiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ConstColor.GreyColor, width: 2),
        ),
        
        alignment: Alignment.center,
        child: Text(
          "Logout",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _isPressed ? ConstColor.WhiteColor : ConstColor.BlackColor,
          ),
        ),
      ),
    );
  }
}
