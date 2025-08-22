import 'package:flutter/material.dart';

import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/Screens/products/widgets/additional_info_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/discription_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';

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
  ScrollController _scrollController = ScrollController();
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
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: AnimatedButtonForCart(),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),

              backgroundColor: _isScrolled
                  ? ConstColor.WhiteColor
                  : Colors.transparent,

              automaticallyImplyLeading: false,
              expandedHeight: 450,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: ConstColor.GreyColor.withValues(alpha: 0.25),
                      ),
                      color: ConstColor.WhiteColor,
                    ),
                    child: Icon(Icons.arrow_back_ios_new, size: 24),
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
                            height: 50,
                            width: 50,
                          ),
                        ),

                        const SizedBox(width: 5),
                        //* product text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.Product_Name,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ConstColor.BlackColor,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                '\$ ${widget.product.Product_price.toString()}',
                                style: TextStyle(
                                  fontSize: 12,
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
                        height: 308,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Details Column
              //*text +veg
              Container(
                padding: EdgeInsets.all(15),
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
                        Text(
                          widget.product.Product_Name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: ConstColor.BlackColor,
                          ),
                        ),
                        IsVegButtonWidget(IsVeg: widget.product.IsVeg),
                      ],
                    ),
                    const SizedBox(height: 10),

                    RatingBarWidget(
                      Product_rating: widget.product.Product_rating,
                    ),
                    const SizedBox(height: 16),

                    //*quantity + price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //* Quanitity
                        Text(
                          widget.product.Product_quantity,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.mediumBlack,
                          ),
                        ),

                        //*price:
                        Text(
                          '\$ ${widget.product.Product_price.toString()}',
                          style: TextStyle(
                            color: ConstColor.DailyPlusGreen,
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: EdgeInsets.all(15),
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

                    const SizedBox(width: 10),

                    AdditionalInfoWidget(
                      text: 'Fast Delivery',
                      onPress: () {},
                      icon: Icons.delivery_dining_outlined,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              //*Highlights Informtion.
              //*white container
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstColor.WhiteColor,
                ),
                //*shadow container Inner
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ConstColor.shadowColor,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Highlights',
                        style: TextStyle(
                          fontSize: 15,
                          color: ConstColor.BlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      //*always Visible
                      DiscriptionWidget(
                        type: 'Brand',
                        discription: widget.product.Product_Name,
                      ),

                      const SizedBox(height: 10),
                      DiscriptionWidget(
                        type: 'Product Type',
                        discription: widget.product.Product_Category,
                      ),

                      const SizedBox(height: 10),

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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
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
                              children: const [
                                Text(
                                  'View More',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.pink,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      
                        secondChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                      
                            // your repeated widgets (use List.generate for cleaner code)
                            DiscriptionWidget(
                              type: 'Weight',
                              discription: widget.product.Product_quantity,
                            ),
                      
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(
                              type: 'Deitary  preference',
                              widget: IsVegButtonWidget(
                                IsVeg: widget.product.IsVeg,
                              ),
                            ),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(
                              type: 'Key Features',
                              discription: widget.product.Product_description,
                            ),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Imported'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Fssai Licensce'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Nutrition Information'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Packaging Type'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Imported'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(type: 'Fssai Licensce'),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(
                              type: 'Rating',
                              discription: widget.product.Product_rating
                                  .toString(),
                            ),
                            const SizedBox(height: 10),
                      
                            DiscriptionWidget(
                              type: 'Price',
                              discription: widget.product.Product_price
                                  .toString(),
                            ),
                            const SizedBox(height: 10),
                      
                            GestureDetector(
                              onTap: () {
                                setState(() => clickedViewMore = false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'View Less',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_up_outlined,
                                    color: Colors.pink,
                                    size: 24,
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

              Row(
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 24,
                    color: ConstColor.BlackColor,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    widget.product.Product_Category,
                    style: TextStyle(
                      fontSize: 16,
                      color: ConstColor.BlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              //*icon + description
              Row(
                children: [
                  Icon(Icons.menu, size: 24, color: ConstColor.BlackColor),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      widget.product.Product_description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ConstColor.BlackColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                'You can also check this items',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ConstColor.normalBlack,
                ),
              ),

              //* Similar Product Logic:
            ],
          ),
        ),
      ),
    );
  }
}
