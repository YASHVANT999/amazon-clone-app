import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/provider/user_provider.dart';

class AccountBox extends StatelessWidget {
  const AccountBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 188, 232, 230),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 3, top: 8, right: 7),
            child: Icon(
              Icons.location_pin,
              size: 19,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 3, top: 8, right: 7),
            child: Text(
              "Delivery to " + user.name + " - " + user.address + " ...",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.arrow_drop_down),
          )
        ],
      ),
    );
  }
}
