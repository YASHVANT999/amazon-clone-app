import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tiko/constrants/global_variable.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Text(
              "Deal of Day",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: CarouselSlider(
              items: GlobalVariables.dodImage.map(
                (i) {
                  return Builder(
                      builder: (BuildContext context) => Container(
                            child: CachedNetworkImage(
                              imageUrl: i,
                              height: 235,
                              fit: BoxFit.fitHeight,
                            ),
                          ));
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 235,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: GlobalVariables.dodImage
                  .map(
                    (e) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CachedNetworkImage(
                        imageUrl: e,
                        fit: BoxFit.fitWidth,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
