import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/products/product_details_page.dart';
import 'package:grocceryplus/Screens/products/widgets/product_card_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class ProductListScreen extends StatefulWidget {
  final String Product_Category;
  const ProductListScreen({required this.Product_Category, super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slideAnimation = Tween(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();

    UploadProductsToFireStore();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: CircularAvatarWidget(
          icon: Icons.arrow_back_ios_new,
          color: ConstColor.BlackColor,
          iconPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
        ),
        elevation: 2,
        title: Text(
          widget.Product_Category,
          style: TextStyle(
            fontSize: Responsive.w(0.046),
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(Responsive.w(0.037)),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .where(
                      'Product_Category',
                      isEqualTo: widget.Product_Category,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ProgressIndicatorWidget();
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Snapshot has error'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('Snapshot is empty');
                  }

                  final products = snapshot.data!.docs;

                  print('Items build: ${products.length}');

                  return SlideTransition(
                    position: slideAnimation,
                    child: GridView.builder(
                      itemCount: products.length,

                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Responsive.h(0.015),
                        crossAxisSpacing: Responsive.w(0.032),
                        childAspectRatio: 0.5,
                      ),

                      itemBuilder: (context, index) {
                        final ProductData =
                            products[index].data() as Map<String, dynamic>;

                        final productModel = ProductsModel.fromMap(ProductData);

                        return ProductCardWidget(
                          Product_Image: productModel.Product_Image,
                          Product_name: "$index - ${productModel.Product_Name}",
                          Product_price: productModel.Product_price,
                          Product_rating: productModel.Product_rating,
                          IsVeg: productModel.IsVeg,
                          Product_quantity: productModel.Product_quantity,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsPage(product: productModel),
                              ),
                            );
                          },
                        );
                      },
                    ),
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
