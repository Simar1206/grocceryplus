// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:grocceryplus/firebase/repository.dart';
// import 'package:grocceryplus/theme/const_color.dart';
// import 'package:grocceryplus/widgets/action_button_widget.dart';

// class OtpVerficationScreen extends StatefulWidget {
//   final String verficationId;
//   final String phoneNumber;
//   const OtpVerficationScreen({
//     required this.phoneNumber,
//     required this.verficationId,
//     super.key,
//   });

//   @override
//   State<OtpVerficationScreen> createState() => _OtpVerficationScreenState();
// }

// class _OtpVerficationScreenState extends State<OtpVerficationScreen> {
//   late final TextEditingController _pinController;
//   final repo = Repository();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pinController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _pinController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final maskedphoneNumber = widget.phoneNumber.replaceRange(3, 8, 'XXXXX');

//     return Scaffold(
//       bottomSheet: ActionButtonWidget(
//         onPress: () async {
//           if (_pinController.text.isEmpty) {
//             final result = await repo.verifyOTP(
//               verificationId: widget.verficationId,
//               smsCode: _pinController.text,
//             );
//             if (result.FirebaseResult) {
//               Get.snackbar('Otp Verfication Successfull', '');
//             } else {
//               Get.snackbar('Otp verifcation failed', '');
//             }
//           } else {
//             Get.snackbar('kindly fill out the pin', '');
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
//                   'Enter your Verification code',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleLarge!.copyWith(color: Color(0xff37474F)),
//                 ),

//                 const SizedBox(height: 10),
//                 Text(
//                   'We have sent SMS to:',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: ConstColor.TextfieldBackground,
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
