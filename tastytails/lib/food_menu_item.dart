// food_menu_item.dart

import 'package:flutter/material.dart';
import 'package:tastytails/cartpage.dart';

class FoodMenuItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final Function(FoodMenuItem) addToCart;

  const FoodMenuItem({
    required this.name,
    required this.price,
    required this.image,
    required this.addToCart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            Text('Price: $price'),
            Spacer(), 
            ElevatedButton(
              onPressed: () {
                addToCart(this);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
