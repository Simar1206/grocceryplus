import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/home/widgets/category_card_widget.dart';
import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/models/category_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  //* Getx Controllers:
  NavigationController navigationController = Get.find<NavigationController>();

  void navigatetoplace(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(Product_Category: categoryName),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationController.selectedIndex.value = 1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsets.only(right: 15),
        centerTitle: true,

        title: const Text(
          'All Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),

        actions: [Icon(Icons.search, color: ConstColor.normalBlack)],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //*load category from firestore
            Expanded(
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
                      final categoryData =
                          Category[index].data() as Map<String, dynamic>;

                      //* It takes the raw data map from Firestore and uses the fromMap factory constructor in your CategoryModel to create a type-safe CategoryModel object.
                      final categoryModel = CategoryModel.fromMap(categoryData);

                      return CategoryCardWidget(
                        onPress: () {
                          final selectedCategoryName =
                              categoryModel.Category_Name;
                          navigatetoplace(selectedCategoryName);
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
