// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grocceryplus/theme/const_color.dart';
// import 'package:grocceryplus/widgets/action_button_widget.dart'; // Assuming this is your ActionButtonWidget

// class AddToBagControllerDark extends GetxController {
//   final currentValue = 1.obs;
//   final isPressed = false.obs;

//   void increment() => currentValue.value++;
//   void decrement() {
//     if (currentValue.value > 1) {
//       currentValue.value--;
//     } else {
//       isPressed.value = false;
//     }
//   }

//   void pressButton() => isPressed.value = true;
// }

// class AddToBagWidgetDark extends StatelessWidget {
//   final String buttonText;
//   final IconData? icon;
//   final VoidCallback onPress;
//   final AddToBagControllerDark controller;

//   const AddToBagWidgetDark({
//     required this.onPress,
//     required this.buttonText,
//     required this.icon,
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => AnimatedContainer(
//         height: 40,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
        
      
//         // Use AnimatedSwitcher to switch between the two main states
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 300),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return ScaleTransition(scale: animation, child: child);
//           },
//           child: controller.isPressed.value
//               ? // The "View Cart" and Counter state
//                 Row(
//                   key: const ValueKey('counter_state'),
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // View Cart Button
//                     AddToBagButtonWidgetDark(
//                       onPress: () {},
//                       ButtonText: 'View Cart',
//                       icon: null,
//                     ),

//                     // Counter
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             onPressed: controller.decrement,
//                             icon: const Icon(
//                               Icons.remove,
//                               color: ConstColor.WhiteColor,
//                               size: 24,
//                             ),
//                           ),
//                           Obx(
//                             () => Text(
//                               controller.currentValue.value.toString(),
//                               style: const TextStyle(
//                                 color: ConstColor.WhiteColor,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: controller.increment,
//                             icon: const Icon(
//                               Icons.add,
//                               color: ConstColor.WhiteColor,
//                               size: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               : // The initial "Add to Bag" state
//                 GestureDetector(
//                   key: const ValueKey('initial_state'),
//                   onTap: () {
//                     onPress();
//                     controller.pressButton();
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(icon, size: 24, color: ConstColor.DailyPlusGreen),
//                         Text(
//                           buttonText,
//                           style: const TextStyle(
//                             color: ConstColor.WhiteColor,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         // Removed SizedBox and used an explicit Spacer instead
//                         // Or you can align it with `MainAxisAlignment.center`
//                         const SizedBox(width: 24),
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

// class AddToBagButtonWidgetDark extends StatelessWidget {
//   final String ButtonText;
//   final IconData? icon;
//   final VoidCallback onPress;
//   const AddToBagButtonWidgetDark({
//     required this.onPress,
//     required this.ButtonText,
//     required this.icon,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: ConstColor.GreyColor.withValues(alpha: 0.25)),
//         color: ConstColor.WhiteColor,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           //*icon
//           Icon(icon, size: 24, color: ConstColor.BlackColor),
//           //*text
//           Text(
//             ButtonText,
//             style: TextStyle(
//               fontSize: 12,
//               color: ConstColor.BlackColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//     // return Padding(
//     //   padding: const EdgeInsets.all(20.0),
//     //   child: SizedBox(
//     //     height: 48,
//     //     child: TextButton(
//     //       style: ButtonStyle(
//     //         shape: WidgetStatePropertyAll(
//     //           RoundedRectangleBorder(
//     //             borderRadius: BorderRadiusGeometry.circular(8),
//     //           ),
//     //         ),
//     //         iconColor: WidgetStatePropertyAll(ConstColor.BlackColor),
//     //         textStyle: WidgetStatePropertyAll(
//     //           TextStyle(
//     //             color: ConstColor.BlackColor,
//     //             fontWeight: FontWeight.w500,
//     //             fontSize: 16,
//     //           ),
//     //         ),
//     //         backgroundColor: WidgetStatePropertyAll(ConstColor.WhiteColor),
//     //       ),
//     //       onPressed: onPress,
//     //       child: Row(
//     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //         children: [
//     //           Text(textAlign: TextAlign.center, ''),
//     //           Text(
//     //             textAlign: TextAlign.center,
//     //             ButtonText,
//     //             style: TextStyle(color: ConstColor.BlackColor),
//     //           ),
//     //           Icon(icon, size: 24, color: ConstColor.BlackColor),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
