import 'package:flutter/material.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/features/account/widgets/single_product.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See All',
                style: TextStyle(
                    fontSize: 15,
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          child: SingleProduct(
              imageUrl:
                  "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-finish-select-202207-6-1inch-product-red?wid=2560&hei=1440&fmt=jpeg&qlt=95&.v=1656720518797"),
        )
      ],
    );
  }
}
