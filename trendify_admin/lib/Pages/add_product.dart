import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trendify_admin/Controller/home_page_controller.dart';
import 'package:trendify_admin/Reuseable%20Widgets/drop_down_btn.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.greenAccent.shade100, //change your color here
          ),
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            "Add New Product",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent.shade100,
                fontSize: 30),
          )),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 10),
            width: double.maxFinite,
            color: Colors.greenAccent.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: ctrl.ProductName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      "Product Name",
                    ),
                    hintText: 'Enter your Product Name',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ctrl.ProductDescription,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      "Product Description",
                    ),
                    hintText: 'Enter your Product Description',
                  ),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ctrl.ImageURL,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      "Image URL",
                    ),
                    hintText: 'Enter Image URL',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ctrl.ProductPrice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      "Price",
                    ),
                    hintText: 'Enter Product Price',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: DropDownBtn(
                      items: ['Earings', 'Rings', 'Necklace', 'BridalSets', 'Pendants', 'NosePins', 'MathaPati'],
                      selectedItemText: ctrl.category,
                      onSelected: (SelectedValue) {
                        ctrl.category = selectedValue ?? 'general';
                        ctrl.update();
                      },
                    )),
                    Expanded(
                        child: DropDownBtn(
                      items: ['tjwholesale', 'LimeLight', 'Jadenos', 'crystalbloom', 'tesoro'],
                      selectedItemText: ctrl.brand,
                      onSelected: (SelectedValue) {
                        ctrl.brand = selectedValue ?? 'no brand';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Offer Product?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                DropDownBtn(
                  items: ["True", "false"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (SelectedValue) {
                    ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;

                    ctrl.update();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 50),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ctrl.addProduct();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 70, vertical: 10), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
