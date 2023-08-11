import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/provider/user_provider.dart';

class BelowAppbar extends StatelessWidget {
  const BelowAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  text: 'Hello, ',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                  children: [
                TextSpan(
                  text: user.name,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )
              ]))
        ],
      ),
    );
  }
}
