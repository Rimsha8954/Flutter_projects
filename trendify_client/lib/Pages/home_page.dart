import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trendify_client/Controller/home_controller.dart';
import 'package:trendify_client/Pages/login_page.dart';
import 'package:trendify_client/Pages/product_details.dart';
import 'package:trendify_client/Reuseabl_Widgets/multi_select_dropdown.dart';
import 'package:trendify_client/Reuseabl_Widgets/product_card.dart';

import '../Reuseabl_Widgets/drop_down_btn.dart';

String? selectedValue;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
                  "Trendify",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    box.erase();
                    Get.offAll(LoginPage());
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  )),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: ctrl.productCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          ctrl.filterByCategory(ctrl.productCategories[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Chip(label: Text(ctrl.productCategories[index].name ?? 'Error')),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  Expanded(
                      child: DropDownBtn(
                        items: ['Rs: High to Low', 'Rs: Low to High'],
                        selectedItemText: 'Sort',
                        onSelected: (SelectedValue) {
                          ctrl.sortByPrice(ascending:  SelectedValue == 'Rs: Low to High' ? true : false);
                        },
                      )),
                  Expanded(
                      child: MultiSelectDropdown(
                        items: const [
                          'Jadenos',
                          'Tesoro',
                          'Tjwholesale',
                          'LimeLight',
                        ],
                        onSelectionChanged: (selectedItems) {
                          ctrl.filterByBrand(selectedItems);
                        },
                      )),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemCount: ctrl.productsShowInUi.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productsShowInUi[index].name ?? 'No Name',
                        imageURL: ctrl.productsShowInUi[index].image ?? 'URL',
                        price: ctrl.productsShowInUi[index].price ?? 00,
                        offerTag: '25% off',
                        onTap: () {
                          Get.to(ProductDetails(), arguments: {
                            'data': ctrl.productsShowInUi[index]
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
