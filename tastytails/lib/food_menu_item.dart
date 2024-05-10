import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  final String name;
  final double price; // Updated to double
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
      elevation: 4, // Add elevation for a distinct appearance
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Add rounded corners
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Add rounded corners to image
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
            Text('Price: \$${price.toStringAsFixed(2)}'), // Format price as a string
            Spacer(),
            ElevatedButton(
              onPressed: () => addToCart(this),
              child: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                // Add visual feedback to the button
                elevation: 2,
                backgroundColor: Colors.red, // Change button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
