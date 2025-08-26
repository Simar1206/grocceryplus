import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/home/widgets/category_card_widget.dart';
import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/models/category_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';
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
    UploadCategoryToFireStore();
  }

  void navigatetoplace(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(Product_Category: categoryName),
      ),
    );
  }

  int _currentHeaderIndex = 0;

  void setHeaderIndex(int index) {
    setState(() {
      _currentHeaderIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              pinned: true,

              //floating: true,
              toolbarHeight: Responsive.h(0.19),

              title: Column(
                children: [
                  //*User details and locations:
                  TopBarWIdget(),

                  SizedBox(height: Responsive.h(0.01)),

                  //*search FIELD
                  AnimatedTextField(
                    animationType: Animationtype.slide,
                    animationDuration: Duration(seconds: 2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: ConstColor.WhiteColor,
                      hintText: 'Search Anything',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        fontSize: Responsive.fs(0.037),

                        fontWeight: FontWeight.w400,
                        color: ConstColor.mediumBlack,
                      ),
                      iconColor: ConstColor.normalBlack,
                    ),
                    hintTexts: [
                      "Search for 'Milk'",
                      "Search for 'Chocolate'",
                      "Search for 'Face Wash'",
                      "Search for 'Baarish'",
                      "Search for 'Lego'",
                      "Search for 'Phone'",
                      "Search for 'Milk'",
                      "Search for 'Zepto Cafe'",
                      "Search for 'Earrings'",
                      "Search for 'Maggie'",
                    ],
                  ),

                  SizedBox(height: Responsive.h(0.016)),

                  //* LIST OF ITEMS HEADER:
                  SizedBox(
                    height: Responsive.h(0.064),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HeaderList(
                          icon: Icons.shopping_bag_outlined,
                          Discription: 'All',
                          onPress: () {
                            setHeaderIndex(0);
                          },
                          IsSelected: _currentHeaderIndex == 0,
                        ),

                        HeaderList(
                          icon: Icons.local_offer_outlined,
                          Discription: '80% Off',
                          onPress: () {
                            setHeaderIndex(1);
                          },
                          IsSelected: _currentHeaderIndex == 1,
                        ),

                        HeaderList(
                          icon: Icons.medical_services_outlined,
                          Discription: 'Pharmacy',
                          onPress: () {
                            setHeaderIndex(2);
                          },
                          IsSelected: _currentHeaderIndex == 2,
                        ),

                        HeaderList(
                          icon: Icons.eco_outlined,
                          Discription: 'Fresh',
                          onPress: () {
                            setHeaderIndex(3);
                          },
                          IsSelected: _currentHeaderIndex == 3,
                        ),

                        HeaderList(
                          icon: Icons.headset_outlined,
                          Discription: 'Electronics',
                          onPress: () {
                            setHeaderIndex(4);
                          },
                          IsSelected: _currentHeaderIndex == 4,
                        ),

                        HeaderList(
                          icon: Icons.brush_outlined,
                          Discription: 'Home',
                          onPress: () {
                            setHeaderIndex(5);
                          },
                          IsSelected: _currentHeaderIndex == 5,
                        ),

                        HeaderList(
                          icon: Icons.spa_outlined,
                          Discription: 'Spa',
                          onPress: () {
                            setHeaderIndex(6);
                          },
                          IsSelected: _currentHeaderIndex == 6,
                        ),

                        HeaderList(
                          icon: Icons.star_outline,
                          Discription: 'New',
                          onPress: () {
                            setHeaderIndex(7);
                          },
                          IsSelected: _currentHeaderIndex == 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.w(0.037)),
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
                return Text('!snapshot.hasData || snapshot.data!.docs.isEmpty');
              }
              final Category = snapshot.data!.docs;

              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,

                itemCount: Category.length,

                padding: EdgeInsets.zero,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: Responsive.h(0.015),
                  crossAxisSpacing: Responsive.w(0.032),
                ),
                itemBuilder: (context, index) {
                  //*retrieves the raw data from the specific document at the current index. returns data as Map<String, dynamic>
                  final categoryData =
                      Category[index].data() as Map<String, dynamic>;

                  //* It takes the raw data map from Firestore and uses the fromMap factory constructor in your CategoryModel to create a type-safe CategoryModel object.
                  final categoryModel = CategoryModel.fromMap(categoryData);

                  return CategoryCardWidget(
                    onPress: () {
                      final selectedCategoryName = categoryModel.Category_Name;
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
      ),
    );
  }
}

class TopBarWIdget extends StatelessWidget {
  const TopBarWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            //TODO: navigate  to profile page
            Get.toNamed('/settings_page');
          },
          child: Container(
            padding: EdgeInsets.all(Responsive.w(0.005)),
            decoration: BoxDecoration(
              border: Border.all(
                width: Responsive.w(0.005),
                color: ConstColor.DailyPlusGreenLight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              size: Responsive.fs(0.056),
              Icons.person,
              color: ConstColor.DailyPlusGreenLight,
            ),
          ),
        ),

        SizedBox(width: Responsive.w(0.025)),

        //*Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*to display two different text style
            Row(
              children: [
                Text(
                  'Delivery In',
                  style: TextStyle(
                    fontSize: Responsive.fs(0.039),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' 12 Mins',
                  style: TextStyle(
                    color: ConstColor.DailyPlusGreen,
                    fontSize: Responsive.fs(0.039),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            //*LLocation:
            Row(
              children: [
                Text(
                  '*to insert the location from APi*',
                  style: TextStyle(
                    fontSize: Responsive.fs(0.030),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    //TODO: NAvigate to locations page
                  },
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: Responsive.fs(0.05),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class HeaderList extends StatelessWidget {
  final IconData icon;
  final String Discription;
  final VoidCallback onPress;
  final bool IsSelected;

  const HeaderList({
    required this.icon,
    required this.Discription,
    required this.onPress,
    this.IsSelected = false,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.w(0.046)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: IsSelected
                  ? ConstColor.BlackColor
                  : ConstColor.mediumBlack,
            ),
            SizedBox(height: Responsive.h(0.005)),
            Text(
              Discription,
              style: TextStyle(
                fontSize: Responsive.fs(0.025),
                fontWeight: FontWeight.w500,
                color: IsSelected
                    ? ConstColor.BlackColor
                    : ConstColor.mediumBlack,
              ),
            ),

            if (IsSelected) ...[
              AnimatedContainer(
                height: Responsive.h(0.004),
                width: IsSelected ? Responsive.w(0.16) : 0,
                margin: EdgeInsets.only(top: 4),
                color: IsSelected ? ConstColor.BlackColor : Colors.transparent,

                duration: Duration(seconds: 5),
                curve: Curves.fastOutSlowIn,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
