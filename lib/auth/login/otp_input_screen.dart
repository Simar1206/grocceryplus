
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grocceryplus/firebase/repository.dart';
// import 'package:grocceryplus/theme/const_color.dart';
// import 'package:grocceryplus/widgets/action_button_widget.dart';

// class OtpInputScreen extends StatefulWidget {
//   const OtpInputScreen({super.key});

//   @override
//   State<OtpInputScreen> createState() => _OtpInputScreen();
// }

// class _OtpInputScreen extends State<OtpInputScreen> {
//   final Repository repo = Repository();
//   late final TextEditingController _phoneController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _phoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomSheet: ActionButtonWidget(
//         onPress: () async {
//           if (_phoneController.text.isNotEmpty) {
//             final phoneNumber = '+91${_phoneController.text}';
//             await repo.SendOTP(
//               message: phoneNumber,
//               verificationCompleted: (credential) async {},
//               verificationFailed: (e) {
//                 Get.snackbar('Failed to Verify OTP', 'Try again later');
//               },
//               codeSent: (verficationId, resendToken) {
//                 Get.toNamed(
//                   '/otp_verfication_screen',
//                   arguments: {
//                     'verficationId': verficationId,
//                     'resendToken': resendToken,
//                   },
//                 );
//               },
//               codeAutoRetrievalTimeout: (verficationId) {
//                 print(
//                   'from code Auto Retirval TImeout from otpinput screen: $verficationId',
//                 );
//               },
//             );
//           } else {
//             Get.snackbar('Fill All the fields', 'Try again Later');
//           }
//         },
//         ButtonText: 'Next',
//         icon: Icons.arrow_right_alt,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('assets/images/mobilepic.png'),
//           Container(
//             padding: EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 46),

//                 Text(
//                   'Enter your mobile number',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleLarge!.copyWith(color: Color(0xff37474F)),
//                 ),

//                 const SizedBox(height: 10),

//                 Text(
//                   'We need to verify you. We will send you a one time verification code. ',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xffBD37474F),
//                   ),
//                 ),
//                 const SizedBox(height: 28),

//                 TextField(
//                   controller: _phoneController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: ConstColor.TextfieldBackground,
//                     prefixIcon: Icon(Icons.call_outlined),
//                     hint: Text('Phone Number'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     hintStyle: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: ConstColor.normalBlack,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
