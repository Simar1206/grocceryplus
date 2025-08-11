import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class CategoryModel {
  final Category_Image;
  final Category_Name;

  CategoryModel({required this.Category_Image, required this.Category_Name});

  //converting class to Map
  Map<String, dynamic> toMap() {
    return {'Category_Image': Category_Image, 'Category_Name': Category_Name};
  }

  //fetching obj from firestore:
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      Category_Image: map['Category_Image'] ?? '',
      Category_Name: map['Category_Name'] ?? '',
    );
  }
}

List<CategoryModel> groccery_category = [
  CategoryModel(
    Category_Image: 'assets/images/category/fruits&vegies.png',
    Category_Name: 'Fruits & Vegetables',
  ),

  CategoryModel(
    Category_Image: 'assets/images/category/breakfast.png',
    Category_Name: 'Breakfast',
  ),

  CategoryModel(
    Category_Image: 'assets/images/category/beverages.png',
    Category_Name: 'Beverages',
  ),

  CategoryModel(
    Category_Image: 'assets/images/category/meat&fish.png',
    Category_Name: 'Meat & Fish',
  ),

  CategoryModel(
    Category_Image: 'assets/images/category/snacks.png',
    Category_Name: 'Snacks',
  ),

  CategoryModel(
    Category_Image: 'assets/images/category/diary.png',
    Category_Name: 'Dairy',
  ),
];

//*to upload categories to firestore collection-> category, docs-> products
Future<void> UploadCategoryToFireStore() async {
  for (final category in groccery_category) {
    await FirebaseFirestore.instance
        .collection('category')
        .add(category.toMap());
  }
  print('Categories Uploaded');
}
