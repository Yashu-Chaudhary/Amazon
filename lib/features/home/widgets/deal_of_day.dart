import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 15),
          child: Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Text(
            '\$999',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text(
            'productName',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Image.network(
                'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://harekrishnamart.com/cdn/shop/files/WhatsAppImage2024-09-11at16.34.49.jpg?v=1726052897&width=1946',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              
            ],
          ),
        ),
        Container(
                padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
                alignment: Alignment.topLeft,
                child: Text('See all deals',style: TextStyle(color: Colors.cyan[800]),),
              ),
      ],
    );
  }
}
