import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
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
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
