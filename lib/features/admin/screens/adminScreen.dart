import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/features/admin/screens/post_screen.dart';
import 'package:tiko/provider/user_provider.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/home';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  final _page = [
    const PostScreen(),
    const Center(
      child: Text("Sales Page"),
    ),
    const Center(
      child: Text("Analytics Page"),
    )
  ];
  void changeScreen(int _page) {
    setState(() {
      page = _page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/amazon_in.png',
                width: 115,
                height: 45,
                color: Colors.black,
              ),
            ),
            Container(
              child: Text(
                "Admin",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            )
          ]),
        ),
      ),
      body: _page[page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: changeScreen,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? Colors.cyan[800]!
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
              label: '',
            ),
            // ACCOUNT
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.analytics_outlined,
                ),
              ),
              label: '',
            ),
            // CART
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.all_inbox_outlined,
                ),
              ),
              label: '',
            ),
          ]),
    );
  }
}
