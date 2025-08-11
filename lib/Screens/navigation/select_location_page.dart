import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 39.0, horizontal: 16),
        child: Column(
          children: [
            //*search TextField
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: ConstColor.TextfieldBackground,
                hintText: 'Search for location',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.w400,
                  color: ConstColor.mediumBlack,
                ),
                iconColor: ConstColor.normalBlack,
              ),
            ),

            const SizedBox(height: 22),

            //*Places Widget List
            const SizedBox(height: 45),

            //*Action button
            ActionButtonWidget(
              onPress: () {},
              ButtonText: 'Save This Location',
              icon: Icons.save_outlined,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: Column()),
    );
  }
}
