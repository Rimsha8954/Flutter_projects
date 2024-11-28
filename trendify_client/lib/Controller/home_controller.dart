import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_client/Models/product_category/product_category.dart';

import '../Models/product/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  List<Product> products = []; //List to store the products
  List<Product> productsShowInUi = [];
  List<ProductCategory> productCategories = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('Products');
    categoryCollection = firestore.collection('Category');

    await fetchProducts();
    await fetchCategory();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final Iterable<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      productsShowInUi.assignAll(products);
      Get.snackbar("Success", "Product fetch Successfully",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final Iterable<ProductCategory> retrievedCategories = categorySnapshot
          .docs
          .map((doc) =>
              ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      productCategories.clear();
      productCategories.assignAll(retrievedCategories);
      Get.snackbar("Success", "Category fetch Successfully",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  filterByCategory(String category) {

    productsShowInUi.clear();
    productsShowInUi = products.where((product) => product.category == category).toList();
    update();
  }

  filterByBrand(List<String> brands){
    if(brands.isEmpty){
      productsShowInUi = products;
    }else{
      List<String> lowerCaseBrands = brands.map((brand) => brand.toLowerCase()).toList();
      productsShowInUi = products.where((product) => lowerCaseBrands.contains(product.brand?.toLowerCase() ?? '')).toList();
     }
    update();
  }

  sortByPrice({required bool ascending}){
    List<Product> sortedProducts = List<Product>.from(productsShowInUi);
    sortedProducts.sort((a,b) => ascending ? a.price!.compareTo(b.price!) : b.price!.compareTo(a.price!));
    productsShowInUi = sortedProducts;
    update();
  }

}
