import 'package:flutter/material.dart';
import 'package:tiko/features/account/widgets/account_button.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your Orders", onTap: () {}),
            AccountButton(text: "Logout", onTap: () {}),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            AccountButton(text: "Your Account", onTap: () {}),
            AccountButton(text: "Your Waitlist", onTap: () {}),
          ],
        )
      ],
    ));
  }
}
