import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/Screens/products/widgets/additional_info_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/highlights_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

import 'package:grocceryplus/widgets/animated_button_for_cart.dart';
import 'package:grocceryplus/widgets/is_Veg_button_widget.dart';
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
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.h(0.03),
          horizontal: Responsive.w(0.046),
        ),
        child: AnimatedButtonForCart(product: widget.product),
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
                  Get.back();
                  //Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProductListScreen(
                  //       Product_Category: widget.product.Product_Category,
                  //     ),
                  //   ),
                  // );
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
                CircularAvatarWidget(
                  icon: Icons.favorite_outline,

                  color: ConstColor.BlackColor,
                  iconPress: () {},
                ),
                //*search
                CircularAvatarWidget(
                  icon: Icons.search_rounded,
                  color: ConstColor.BlackColor,
                  iconPress: () {},
                ),
                //*download
                CircularAvatarWidget(
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

              //*Addtional Information Widget:
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
                      text: 'No Returns',
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

              //*Highlights Informtion:
              Flexible(
                child: SingleChildScrollView(
                  child: HighlightsWidget(
                    product: widget.product,
                    clickedViewMore: clickedViewMore,
                    onToggle: () {
                      setState(() {
                        clickedViewMore = !clickedViewMore;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(0.04)),

              Text(
                'View Similar',
                style: TextStyle(
                  fontSize: Responsive.w(0.037),
                  fontWeight: FontWeight.w500,
                  color: ConstColor.normalBlack,
                ),
              ),

              SizedBox(height: 5),

              //* Similar Product Logic:
              //Expanded(child: ViewSimilarWidget(product: widget.product)),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
