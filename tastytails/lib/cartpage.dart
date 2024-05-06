// cartpage.dart
import 'package:flutter/material.dart';
import 'package:tastytails/food_menu.dart';


class CartPage extends StatelessWidget {
  final List<FoodMenuItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('Price: ${cartItems[index].price}'),
          );
        },
      ),
    );
  }
}
