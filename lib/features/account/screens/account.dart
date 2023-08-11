import 'package:flutter/material.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/features/account/widgets/below_appbar.dart';
import 'package:tiko/features/account/widgets/oredrs.dart';
import 'package:tiko/features/account/widgets/topButton.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  height: 45,
                  width: 120,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.notifications_on_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppbar(),
          SizedBox(
            height: 15,
          ),
          TopButton(),
          SizedBox(
            height: 15,
          ),
          Orders()
        ],
      ),
    );
  }
}
