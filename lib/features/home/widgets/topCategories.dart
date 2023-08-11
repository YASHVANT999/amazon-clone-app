import 'package:flutter/material.dart';
import 'package:tiko/constrants/global_variable.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemExtent: 75,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemCount: GlobalVariables.categoriesImage.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoriesImage[index]['image']!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    GlobalVariables.categoriesImage[index]['title']!,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
