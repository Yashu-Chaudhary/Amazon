import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/accounts/widgets/below_app_bar.dart';
import 'package:amazon/features/accounts/widgets/orders.dart';
import 'package:amazon/features/accounts/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_outlined),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 10),
          Orders(),
        ],
      ),
    );
  }
}
