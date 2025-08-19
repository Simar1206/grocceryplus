import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/products/widgets/product_card_widget.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class ProductListScreen extends StatefulWidget {
  final String Product_Category;
  const ProductListScreen({required this.Product_Category, super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //UploadProductsToFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.Product_Category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

                  return GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 14,
                    ),

                    itemBuilder: (context, index) {
                      final ProductData =
                          products[index].data() as Map<String, dynamic>;

                      final productModel = ProductsModel.fromMap(ProductData);

                      return ProductCardWidget(
                        Product_Image: productModel.Product_Image,
                        Product_name: "$index - ${productModel.Product_Name}",
                        Product_price: productModel.Product_price,
                        onPress: () {},
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
