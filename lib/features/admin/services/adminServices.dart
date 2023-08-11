import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/constrants/http-error.dart';
import 'package:tiko/constrants/utils.dart';
import 'package:tiko/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:tiko/provider/user_provider.dart';

class AdminService {
// adding product from admin side
  void sellProduct({
    required context,
    required String name,
    required String description,
    required List<File> images,
    required double quantity,
    required double price,
    required String category,
    String? id,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      List<String> imageUrl = [];
      final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrl.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          images: imageUrl,
          quantity: quantity,
          price: price,
          category: category,
          id: '');

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-a-product'),
        body: product.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Product added successFully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('$uri/admin/get-all-product'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct(
      {required context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-a-product'),
        body: jsonEncode({'id': product.id}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
          showSnackBar(context, "Product removed successfully!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
