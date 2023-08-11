import 'package:flutter/material.dart';
import 'package:tiko/features/account/widgets/single_product.dart';
import 'package:tiko/features/admin/screens/add_product.dart';
import 'package:tiko/features/admin/screens/adminScreen.dart';
import 'package:tiko/features/admin/services/adminServices.dart';
import 'package:tiko/models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminService _adminService = AdminService();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    products = await _adminService.fetchAllProducts(context);
    setState(() {});
  }

  deleteProduct(Product product, int index) {
    _adminService.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? Center(
              child: const CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: products!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        imageUrl: productData.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                        )),
                        IconButton(
                          onPressed: () {
                            deleteProduct(productData, index);
                          },
                          padding: EdgeInsets.only(right: 10),
                          icon: Icon(
                            Icons.delete_forever_outlined,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.routeName);
        },
        child: Icon(Icons.add_outlined),
        tooltip: 'Add a product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
