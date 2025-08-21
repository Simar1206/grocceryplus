import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/products/product_list_screen.dart';
import 'package:grocceryplus/Screens/products/widgets/additional_info_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/add_to_bag_button_widget.dart';
import 'package:grocceryplus/widgets/add_to_bag_widget_dark.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: AnimatedButtonForCart(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: true,
              toolbarHeight: 57,
              elevation: 0,
              pinned: true,
              floating: true,

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

              //*title:
              title: Text(
                overflow: TextOverflow.ellipsis,
                widget.product.Product_Name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: ConstColor.BlackColor,
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
              //*image
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColor.WhiteColor,
                  ),
                  //*Must match with the tag used in productCardWidget
                  child: Hero(
                    //*advance stuff
                    createRectTween: (begin, end) {
                      return MaterialRectArcTween(begin: begin, end: end);
                    },
                    transitionOnUserGestures: true,
                    tag:
                        '${widget.product.Product_Name}_${widget.product.Product_Image}',
                    child: Image.asset(
                      widget.product.Product_Image,
                      fit: BoxFit.cover,
                      height: 308,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //* Details Column

              //*text +veg
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

              RatingBarWidget(Product_rating: widget.product.Product_rating),
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
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    icon: Icons.bolt_outlined,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              //* icon + category
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
