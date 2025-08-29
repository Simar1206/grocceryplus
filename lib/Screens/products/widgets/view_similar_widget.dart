import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/progress_indicator_widget.dart';

class ViewSimilarWidget extends StatelessWidget {
  ProductsModel product;
  ViewSimilarWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .where('Product_Category', isEqualTo: product.Product_Category)
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
          return data['Product_Name'] != product.Product_Name;
        }).toList();

        return ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: similarproducts.length,
          itemBuilder: (context, index) {
            final productdata =
                similarproducts[index].data() as Map<String, dynamic>;
            final productModel = ProductsModel.fromMap(productdata);

            return ;

            // return ListTile(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   contentPadding: EdgeInsets.symmetric(
            //     vertical: Responsive.h(0.015),
            //     horizontal: Responsive.w(0.04),
            //   ),
            //   minVerticalPadding: Responsive.h(0.02),
            //   tileColor: ConstColor.WhiteColor,
            //   leading: Image.asset(
            //     productModel.Product_Image,
            //     // width: Responsive.w(0.20),
            //     // height: Responsive.h(0.12),
            //     fit: BoxFit.cover,
            //   ),
            //   title: Text(
            //     productModel.Product_quantity,
            //     style: TextStyle(
            //       fontSize: Responsive.fs(0.04),
            //       color: ConstColor.BlackColor,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "₹${productModel.Product_price}",
            //     style: TextStyle(
            //       fontSize: Responsive.fs(0.045),
            //       color: ConstColor.AccentColor,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     size: Responsive.fs(0.04),
            //     color: ConstColor.BlackColor.withValues(alpha: 0.6),
            //   ),
            // );
          },
        );
      },
    );
  }
}
