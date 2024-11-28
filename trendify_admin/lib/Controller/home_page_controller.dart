import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_admin/Models/product/product.dart';

class HomePageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController ProductName = TextEditingController();
  TextEditingController ProductDescription = TextEditingController();
  TextEditingController ImageURL = TextEditingController();
  TextEditingController ProductPrice = TextEditingController();

  String category = "general";
  String brand = "no Brand";
  bool offer = true;

  List<Product> products = [];

  @override
  void onInit() async{
    productCollection = firestore.collection('Products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: ProductName.text,
        description: ProductDescription.text,
        category: category,
        image: ImageURL.text,
        offer: offer,
        price: double.tryParse(ProductPrice.text),
        brand: brand,
      );

      //We make one product instance and we already toJson and fromJson
      //when we call this toJson it will convert this product instance to Json formate
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("Success", "Product Added Successfully",
          colorText: Colors.green);

      setValueDefault();
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.green);
      print(e);
    }
  }

  fetchProducts() async {
    try{
      QuerySnapshot productSnapshot = await productCollection.get();
      final Iterable<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar("Success", "Product fetch Successfully", colorText: Colors.green);
    }
    catch(e){
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
      
    }finally{
      update();
    }
  }


  deleteProduct(String id) async{
   try{
     await productCollection.doc(id).delete();
     fetchProducts();
   }catch(e){
     Get.snackbar("Error", e.toString(), colorText: Colors.red);
     print(e);
   }

  }

  setValueDefault() {
    ProductName.clear();
    ProductDescription.clear();
    ProductPrice.clear();
    ImageURL.clear();

    category = "General";
    brand = "No Brand";
    offer = true;
    update();
  }
}
