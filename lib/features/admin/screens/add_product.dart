import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/constrants/utils.dart';
import 'package:tiko/features/admin/screens/adminScreen.dart';
import 'package:tiko/features/admin/services/adminServices.dart';
import 'package:tiko/widgets/custom_button.dart';
import 'package:tiko/widgets/custom_textfield.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/addproduct';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _productName.dispose();
    _productDescription.dispose();
    _productPrice.dispose();
    _productQuantity.dispose();
  }

  String selectedValue = "";
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  List<File> images = [];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  final _addProductFormKey = GlobalKey<FormState>();
  final AdminService _adminService = AdminService();

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      _adminService.sellProduct(
          context: context,
          name: _productName.text,
          description: _productDescription.text,
          images: images,
          quantity: double.parse(_productQuantity.text),
          price: double.parse(_productPrice.text),
          category: selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: const Text(
            'Add a product',
            // style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 150,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Select Product Images",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Icon(
                                        Icons.folder_open_outlined,
                                        size: 28,
                                      )
                                    ]),
                              ))),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      controller: _productName, hintText: 'Product Name'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _productDescription,
                    hintText: 'Description',
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(controller: _productPrice, hintText: 'Price'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: _productQuantity, hintText: 'Quantity'),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 62,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      // isExpanded: true,
                      iconSize: 30.0,

                      items: productCategories.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            selectedValue = val!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(text: "Sell", onTap: sellProduct)
                ],
              ),
            ),
          ),
        ));
  }
}
