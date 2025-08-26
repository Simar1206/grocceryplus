import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/Screens/products/widgets/additional_info_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/discription_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';

import 'package:grocceryplus/widgets/animated_button_for_cart.dart';
import 'package:grocceryplus/widgets/is_Veg_button_widget.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';
import 'package:grocceryplus/widgets/rating_bar_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  //*obj of product model
  final ProductsModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  //*Scroll Controller along with ISScrolled:
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  //*View More Logic:
  bool clickedViewMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 10 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 10 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.h(0.03),
          horizontal: Responsive.w(0.046),
        ),
        child: AnimatedButtonForCart(),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: Responsive.h(0.075),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),

              backgroundColor: _isScrolled
                  ? ConstColor.WhiteColor
                  : Colors.transparent,

              automaticallyImplyLeading: true,
              expandedHeight: Responsive.h(0.40), //should be 45
              elevation: _isScrolled ? 4 : 0,
              pinned: true,
              floating: false,

              //*leading Icon
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        Product_Category: widget.product.Product_Category,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(Responsive.w(0.015)),
                  child: CircleAvatar(
                    backgroundColor: ConstColor.WhiteColor,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: Responsive.w(0.05),
                      color: ConstColor.BlackColor,
                    ),
                  ),
                ),
              ),

              //*title for SliverAppBar:
              title: _isScrolled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        //*product Image:
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            widget.product.Product_Image,
                            fit: BoxFit.cover,
                            height: Responsive.h(0.048),
                            width: Responsive.w(0.104),
                          ),
                        ),

                        SizedBox(width: Responsive.w(0.025)),
                        //* product text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.Product_Name,
                                style: TextStyle(
                                  fontSize: Responsive.fs(0.027),
                                  fontWeight: FontWeight.w400,
                                  color: ConstColor.BlackColor,
                                ),
                              ),

                              SizedBox(height: Responsive.h(0.005)),

                              Text(
                                '\$ ${widget.product.Product_price.toString()}',
                                style: TextStyle(
                                  fontSize: Responsive.fs(0.027),
                                  fontWeight: FontWeight.w700,
                                  color: ConstColor.BlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : null,

              //*flexiblespace BAr Img
              flexibleSpace:
                  //*image
                  Center(
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Image.asset(
                        widget.product.Product_Image,
                        fit: BoxFit.cover,
                        height: Responsive.h(0.33),
                      ),
                    ),
                  ),

              //* Action Icons:
              actions: [
                //*like
                RoundedIconWidget(
                  icon: Icons.favorite_outline,

                  color: ConstColor.BlackColor,
                  iconPress: () {},
                ),
                //*search
                RoundedIconWidget(
                  icon: Icons.search_rounded,
                  color: ConstColor.BlackColor,
                  iconPress: () {},
                ),
                //*download
                RoundedIconWidget(
                  icon: Icons.upload_outlined,
                  color: ConstColor.BlackColor,
                  iconPress: () {},
                ),
              ],
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(Responsive.w(0.037)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Details Column
              //*text +veg
              Container(
                padding: EdgeInsets.all(Responsive.w(0.034)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstColor.WhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.product.Product_Name,
                            style: TextStyle(
                              fontSize: Responsive.w(0.046),
                              fontWeight: FontWeight.w500,
                              color: ConstColor.BlackColor,
                            ),
                          ),
                        ),
                        IsVegButtonWidget(IsVeg: widget.product.IsVeg),
                      ],
                    ),

                    SizedBox(height: Responsive.h(0.010)),

                    RatingBarWidget(
                      Product_rating: widget.product.Product_rating,
                    ),
                    SizedBox(height: Responsive.h(0.017)),

                    //*quantity + price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //* Quanitity
                        Flexible(
                          child: Text(
                            widget.product.Product_quantity,
                            style: TextStyle(
                              fontSize: Responsive.w(0.067),
                              fontWeight: FontWeight.w700,
                              color: ConstColor.mediumBlack,
                            ),
                          ),
                        ),

                        //*price:
                        Text(
                          '\$ ${widget.product.Product_price.toString()}',
                          style: TextStyle(
                            color: ConstColor.DailyPlusGreen,
                            fontSize: Responsive.w(0.067),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Responsive.h(0.025)),

              Container(
                padding: EdgeInsets.all(Responsive.w(0.034)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstColor.WhiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfoWidget(
                      text: 'No Returns Or Exchange',
                      onPress: () {},
                      icon: Icons.cancel_outlined,
                    ),

                    SizedBox(width: Responsive.w(0.023)),

                    AdditionalInfoWidget(
                      text: 'Fast Delivery',
                      onPress: () {},
                      icon: Icons.delivery_dining_outlined,
                    ),
                  ],
                ),
              ),

              SizedBox(height: Responsive.h(0.025)),

              //*Highlights Informtion.
              //*white container
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(Responsive.w(0.034)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColor.WhiteColor,
                  ),
                  //*shadow container Inner
                  child: Container(
                    padding: EdgeInsets.all(Responsive.w(0.034)),
                    decoration: BoxDecoration(
                      color: ConstColor.shadowColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highlights',
                            style: TextStyle(
                              fontSize: Responsive.fs(0.034),
                              color: ConstColor.BlackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: Responsive.h(0.01)),

                          //*always Visible
                          DiscriptionWidget(
                            type: 'Brand',
                            discription: widget.product.Product_Name,
                          ),

                          SizedBox(height: Responsive.h(0.01)),

                          DiscriptionWidget(
                            type: 'Product Type',
                            discription: widget.product.Product_Category,
                          ),

                          SizedBox(height: Responsive.h(0.01)),

                          AnimatedCrossFade(
                            firstCurve: Curves.easeIn,
                            secondCurve: Curves.easeOut,
                            duration: const Duration(milliseconds: 400),

                            crossFadeState: clickedViewMore
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,

                            firstChild: GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickedViewMore = true;
                                });
                              },

                              //*view button to show the rest :
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.w(0.027),
                                  vertical: Responsive.h(0.008),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: ConstColor.GreyColor.withValues(
                                      alpha: 0.15,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View More',
                                      style: TextStyle(
                                        fontSize: Responsive.fs(0.027),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    SizedBox(width: Responsive.w(0.011)),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.pink,
                                      size: Responsive.fs(0.055),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            secondChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: Responsive.w(0.011)),

                                // your repeated widgets (use List.generate for cleaner code)
                                DiscriptionWidget(
                                  type: 'Weight',
                                  discription: widget.product.Product_quantity,
                                ),

                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(
                                  type: 'Deitary  preference',
                                  widget: IsVegButtonWidget(
                                    IsVeg: widget.product.IsVeg,
                                  ),
                                ),

                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(
                                  type: 'Key Features',
                                  discription:
                                      widget.product.Product_description,
                                ),

                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(type: 'Imported'),

                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(type: 'Fssai Licensce'),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(
                                  type: 'Nutrition Information',
                                ),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(type: 'Packaging Type'),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(type: 'Imported'),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(type: 'Fssai Licensce'),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(
                                  type: 'Rating',
                                  discription: widget.product.Product_rating
                                      .toString(),
                                ),
                                SizedBox(height: Responsive.h(0.01)),

                                DiscriptionWidget(
                                  type: 'Price',
                                  discription: widget.product.Product_price
                                      .toString(),
                                ),
                                SizedBox(height: Responsive.h(0.01)),

                                GestureDetector(
                                  onTap: () {
                                    setState(() => clickedViewMore = false);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'View Less',
                                        style: TextStyle(
                                          fontSize: Responsive.fs(0.027),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      SizedBox(width: Responsive.w(0.011)),
                                      Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: Colors.pink,
                                        size: Responsive.fs(0.055),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(0.04)),

              Text(
                'You can also check this items',
                style: TextStyle(
                  fontSize: Responsive.w(0.037),
                  fontWeight: FontWeight.w500,
                  color: ConstColor.normalBlack,
                ),
              ),

              //* Similar Product Logic:
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where(
                        'Product_Category',
                        isEqualTo: widget.product.Product_Category,
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ProgressIndicatorWidget();
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error Occured with Snapshot"));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("SnapShot is Empty"));
                    }

                    final similarproducts = snapshot.data!.docs.where((docs) {
                      final data = docs.data() as Map<String, dynamic>;
                      return data['Product_name'] !=
                          widget.product.Product_Name;
                    }).toList();

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final productdata =
                            similarproducts[index].data()
                                as Map<String, dynamic>;
                        final productModel = ProductsModel.fromMap(productdata);

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ConstColor.WhiteColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ConstColor.shadowColor,
                            ),
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    productModel.Product_Image,
                                    fit: BoxFit.contain,
                                  ),
                                  title: Text(
                                    productModel.Product_quantity,
                                    style: TextStyle(
                                      fontSize: Responsive.fs(0.037),
                                      color: ConstColor.BlackColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  subtitle: Text(
                                    productModel.Product_price.toString(),
                                    style: TextStyle(
                                      fontSize: Responsive.fs(0.04),
                                      color: ConstColor.AccentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
