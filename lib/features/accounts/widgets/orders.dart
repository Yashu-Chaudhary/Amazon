import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/accounts/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946'
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        // -----------------Orders --------------
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(image: list[index]);
              }),
        )
      ],
    );
  }
}
