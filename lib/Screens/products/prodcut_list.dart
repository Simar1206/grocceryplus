import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class ProdcutList extends StatelessWidget {
  final String Product_Category;
  const ProdcutList({required this.Product_Category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Product_Category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.normalBlack,
          ),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('Product_Category', isEqualTo: Product_Category)
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

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),

            itemBuilder: (context, index) {
              final ProductData =
                  products[index].data() as Map<String, dynamic>;

              final productModel = ProductsModel.fromMap(ProductData);

              // return Column(
              //   children: [
              //     Cardw
              //   ],
              // )
            },
          );
        },
      ),
    );
  }
}
