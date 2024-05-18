//food_menu_item.dart
import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  final String name;
  final double price; 
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
      elevation: 4, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), 
          child: Image.asset(
            image,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            Text('Price: \$${price.toStringAsFixed(2)}'), 
            Spacer(),
            ElevatedButton(
              onPressed: () => addToCart(this),
              child: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                
                elevation: 2,
                backgroundColor: Colors.red, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
