import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/home/category_card_widget.dart';
import 'package:grocceryplus/models/category_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsets.only(right: 15),
        title: const Text(
          'Groccey Plus',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),
        actions: [
          Icon(Icons.notifications_outlined, color: ConstColor.normalBlack),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/select_location');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*Icon
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: ConstColor.DailyPlusGreenLight,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: ConstColor.WhiteColor,
                        ),
                      ),

                      const SizedBox(width: 11),

                      //*Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //*title
                          const Text(
                            'Your Location',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //*subitle Reactive
                          const Text(
                            'Locationssssss',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //* forward button
                  Icon(Icons.arrow_forward_ios, color: ConstColor.normalBlack),
                ],
              ),
            ),

            const SizedBox(height: 24),

            //*Search WIdget:
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: ConstColor.TextfieldBackground,
                hintText: 'Search Anything',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.w400,
                  color: ConstColor.mediumBlack,
                ),
                iconColor: ConstColor.normalBlack,
              ),
            ),

            const SizedBox(height: 34),

            //*load category from firestore
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('category')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ProgressIndicatorWidget();
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('snapshot has error'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text(
                      '!snapshot.hasData || snapshot.data!.docs.isEmpty',
                    );
                  }
                  final Category = snapshot.data!.docs;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: Category.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) {
                      //*retrieves the raw data from the specific document at the current index. returns data as Map<String, dynamic>
                      final Category_data =
                          Category[index].data() as Map<String, dynamic>;

                      //* It takes the raw data map from Firestore and uses the fromMap factory constructor in your CategoryModel to create a type-safe CategoryModel object.
                      final categoryModel = CategoryModel.fromMap(
                        Category_data,
                      );

                      return CategoryCardWidget(
                        onPress: () {
                          final selectedCategoryName =
                              categoryModel.Category_Name;
                          // navigatetoplace(selectedCategoryName);
                          print('Card clicked');
                        },
                        Category_image: categoryModel.Category_Image,
                        Category_title: categoryModel.Category_Name,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
