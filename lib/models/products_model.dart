import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final String Product_Category;
  final String Product_Image;
  final String Product_Name;
  final int Product_price;

  ProductsModel({
    required this.Product_Category,
    required this.Product_Image,
    required this.Product_Name,
    required this.Product_price,
  });

  Map<String, dynamic> toMap() {
    return {
      'Product_Category': Product_Category,
      'Product_Image': Product_Image,
      'Product_Name': Product_Name,
      'Product_price': Product_price,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      Product_Category: map['Product_Category'] ?? '',
      Product_Image: map['Product_Image'] ?? '',
      Product_Name: map['Product_Name'] ?? '',
      Product_price: map['Product_price'] ?? 0,
    );
  }
}

Future<void> UploadProductsToFireStore() async {
  print('Item: ${productList.length}');

  for (final products in productList) {
    final NotDuplicateProducts = await FirebaseFirestore.instance
        .collection('products')
        .where('Product_Name', isEqualTo: products.Product_Name)
        .get();

    if(NotDuplicateProducts.docs.isEmpty) {
      await FirebaseFirestore.instance
        .collection('products')
        .add(products.toMap());
      print('Uploaded: ${products.Product_Name}');
    } else {
      print('Skipped duplicate : ${products.Product_Name}');
    }
    
  }
  print('products Uploaded');
}

List<ProductsModel> productList = [
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/amulFreshMilk.webp',
    Product_Name: 'Amul Fresh Milk (1L)',
    Product_price: 65,
  ),
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/Mother Dairy Paneer.webp',
    Product_Name: 'Mother Dairy Paneer (200g)',
    Product_price: 85,
  ),
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/yellow-cow-milk-butter-500x500.webp',
    Product_Name: 'Amul Butter (500g)',
    Product_price: 275,
  ),
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/britannia-processed-cheddar-cheese.webp',
    Product_Name: 'Britannia Cheese Slices (200g)',
    Product_price: 140,
  ),
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/nestle yogurt.webp',
    Product_Name: 'Nestlé Yogurt (100g)',
    Product_price: 30,
  ),
  ProductsModel(
    Product_Category: 'Dairy',
    Product_Image: 'assets/images/products/amul-pure-ghee.webp',
    Product_Name: 'Govardhan Ghee (500ml)',
    Product_price: 320,
  ),

  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Tropicana Orange Juice.webp',
    Product_Name: 'Tropicana Orange Juice (1L)',
    Product_price: 110,
  ),
  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Real Mixed Fruit Juice.webp',
    Product_Name: 'Real Mixed Fruit Juice (1L)',
    Product_price: 115,
  ),
  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Bisleri Mineral Water.webp',
    Product_Name: 'Bisleri Mineral Water (1L)',
    Product_price: 20,
  ),
  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Red Bull Energy Drink (250ml).webp',
    Product_Name: 'Red Bull Energy Drink (250ml)',
    Product_price: 125,
  ),
  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Nescafé Cold Coffee.webp',
    Product_Name: 'Nescafé Cold Coffee (180ml)',
    Product_price: 45,
  ),
  ProductsModel(
    Product_Category: 'Beverages',
    Product_Image: 'assets/images/products/Paper Boat Aam Panna.webp',
    Product_Name: 'Paper Boat Aam Panna (250ml)',
    Product_price: 35,
  ),

  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: "assets/images/products/Kellogg's Corn Flakes.webp",
    Product_Name: "Kellogg's Corn Flakes (500g)",
    Product_price: 175,
  ),
  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: 'assets/images/products/Quaker Oats.webp',
    Product_Name: 'Quaker Oats (1kg)',
    Product_price: 180,
  ),
  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: 'assets/images/products/Nestlé Milo.webp',
    Product_Name: 'Nestlé Milo (400g)',
    Product_price: 210,
  ),
  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: 'assets/images/products/Britannia Whole Wheat Bread.webp',
    Product_Name: 'Britannia Whole Wheat Bread',
    Product_price: 40,
  ),
  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: 'assets/images/products/MTR Ready Idli Mix.webp',
    Product_Name: 'MTR Ready Idli Mix (500g)',
    Product_price: 95,
  ),
  ProductsModel(
    Product_Category: 'Breakfast',
    Product_Image: 'assets/images/products/Saffola Masala Oats.webp',
    Product_Name: 'Saffola Masala Oats (38g x 5)',
    Product_price: 75,
  ),

  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: 'assets/images/products/Parle Hide & Seek Biscuits.webp',
    Product_Name: 'Parle Hide & Seek Biscuits',
    Product_price: 35,
  ),
  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: 'assets/images/products/Lays Classic Salted Chips.webp',
    Product_Name: 'Lays Classic Salted Chips (90g)',
    Product_price: 50,
  ),
  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: "assets/images/products/Haldiram's Bhujia.webp",
    Product_Name: "Haldiram's Bhujia (200g)",
    Product_price: 65,
  ),
  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: 'assets/images/products/Bingo Mad Angles.webp',
    Product_Name: 'Bingo Mad Angles (80g)',
    Product_price: 30,
  ),
  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: 'assets/images/products/Kurkure Masala Munch.webp',
    Product_Name: 'Kurkure Masala Munch (90g)',
    Product_price: 20,
  ),
  ProductsModel(
    Product_Category: 'Snacks',
    Product_Image: 'assets/images/products/Sunfeast Dark Fantasy Choco Fills.webp',
    Product_Name: 'Sunfeast Dark Fantasy Choco Fills',
    Product_price: 35,
  ),

  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'assets/images/products/Fresh Apples.webp',
    Product_Name: 'Fresh Apples (1kg)',
    Product_price: 120,
  ),
  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'assets/images/products/Fresh Banana.webp',
    Product_Name: 'Bananas (1 dozen)',
    Product_price: 60,
  ),
  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'assets/images/products/Tomatoes.webp',
    Product_Name: 'Tomatoes (1kg)',
    Product_price: 35,
  ),
  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'assets/images/products/Potatoes.webp',
    Product_Name: 'Potatoes (1kg)',
    Product_price: 30,
  ),
  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'assets/images/products/Spinach.webp',
    Product_Name: 'Spinach (1 bunch)',
    Product_price: 25,
  ),
  ProductsModel(
    Product_Category: 'Fruits & Vegetables ',
    Product_Image: 'Product_Image',
    Product_Name: 'Green Grapes (500g)',
    Product_price: 90,
  ),

  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Green Grapes.webp',
    Product_Name: 'Chicken Breast (500g)',
    Product_price: 180,
  ),
  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Mutton Curry Cut.webp',
    Product_Name: 'Mutton Curry Cut (500g)',
    Product_price: 380,
  ),
  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Rohu Fish Slices.webp',
    Product_Name: 'Rohu Fish Slices (500g)',
    Product_price: 160,
  ),
  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Prawns.webp',
    Product_Name: 'Fresh Prawns (250g)',
    Product_price: 220,
  ),
  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Eggs - White.webp',
    Product_Name: 'Eggs - White (6 pcs)',
    Product_price: 45,
  ),
  ProductsModel(
    Product_Category: 'Meat & Fish',
    Product_Image: 'assets/images/products/Chicken Sausages.webp',
    Product_Name: 'Chicken Sausages (250g)',
    Product_price: 150,
  ),
];
