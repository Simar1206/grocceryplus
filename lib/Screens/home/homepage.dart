import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/home/category_card_widget.dart';
import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/models/category_model.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void navigatetoplace(String category_Name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProductListScreen(Product_Category: category_Name),
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              pinned: true,

              //floating: true,
              toolbarHeight: 180,

              title: Column(
                children: [
                  //*User details and locations:
                  TopBarWIdget(),

                  const SizedBox(height: 10),

                  //*search FIELD
                  AnimatedTextField(
                    animationType: Animationtype.slide,
                    animationDuration: Duration(seconds: 3),
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
                        fontSize: 16,

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

                  const SizedBox(height: 15),

                  //* LIST OF ITEMS HEADER:
                  SizedBox(
                    height: 60,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

                padding: EdgeInsets.only(top: 0, bottom: 0),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  //*retrieves the raw data from the specific document at the current index. returns data as Map<String, dynamic>
                  final Category_data =
                      Category[index].data() as Map<String, dynamic>;

                  //* It takes the raw data map from Firestore and uses the fromMap factory constructor in your CategoryModel to create a type-safe CategoryModel object.
                  final categoryModel = CategoryModel.fromMap(Category_data);

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
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: ConstColor.DailyPlusGreenLight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              size: 24,
              Icons.person,
              color: ConstColor.DailyPlusGreenLight,
            ),
          ),
        ),

        const SizedBox(width: 11),

        //*Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*to display two different text style
            Row(
              children: [
                const Text(
                  'Delivery In',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const Text(
                  ' 12 Mins',
                  style: TextStyle(
                    color: ConstColor.DailyPlusGreen,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            //*LLocation:
            Row(
              children: [
                const Text(
                  '*to insert the location from APi*',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),

                GestureDetector(
                  onTap: () {
                    //TODO: NAvigate to locations page
                  },
                  child: Icon(Icons.arrow_drop_down_outlined, size: 24),
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
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              // color: IsSelected
              //     ? ConstColor.DailyPlusGreenLight
              //     :
              color: Colors.black,
            ),
            const SizedBox(height: 5),
            Text(
              Discription,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color:
                    // IsSelected
                    //     ? ConstColor.DailyPlusGreenLight
                    //     :
                    Colors.black,
              ),
            ),

            if (IsSelected) ...[
              AnimatedContainer(
                height: 4,
                width: IsSelected ? 70 : 0,
                margin: EdgeInsets.only(top: 4),
                color: IsSelected ? Colors.black : Colors.transparent,

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
