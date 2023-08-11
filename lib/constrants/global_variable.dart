import 'package:flutter/material.dart';

String uri = 'http://172.16.4.118:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 108, 209, 204),
      Color.fromARGB(255, 160, 232, 228),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<Map<String, String>> categoriesImage = [
    {"title": "Mobile", "image": "assets/images/mobiles.jpeg"},
    {"title": "Electronics", "image": "assets/images/electronics.jpeg"},
    {"title": "Essentials", "image": "assets/images/essentials.jpeg"},
    {"title": "Appliances", "image": "assets/images/appliances.jpeg"},
    {"title": "Books", "image": "assets/images/books.jpeg"},
    {"title": "Fashion", "image": "assets/images/fashion.jpeg"},
  ];

  static const List<String> dodImage = [
    "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-finish-select-202207-6-1inch-product-red?wid=2560&hei=1440&fmt=jpeg&qlt=95&.v=1656720518797",
    "https://cdn.pixabay.com/photo/2020/05/26/09/32/product-5222398_960_720.jpg",
    "https://images.squarespace-cdn.com/content/v1/5bf4bf814611a019a7c475f0/1562038085083-DLUD125WWPOUTGYD8Q60/ke17ZwdGBToddI8pDm48kHH9S2ID7_bpupQnTdrPcoF7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0nQwvinDXPV4EYh2MRzm-RRB5rUELEv7EY2n0AZOrEupxpSyqbqKSgmzcCPWV5WMiQ/product%2Bphotography",
    "https://cdn01.pharmeasy.in/dam/products_otc/I40165/durex-condoms-extra-ribbed-3-pieces-2-1641788249.jpg"
  ];

  static const List<String> sliderImage = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];
}
