import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartpage.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({Key? key}) : super(key: key);

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  List<FoodMenuItem> selectedItems = [];

  void addToCart(FoodMenuItem item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: selectedItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return FoodMenuItemCard(
              foodItem: foodItems[index],
              addToCart: addToCart,
            );
          },
        ),
      ),
    );
  }
}

class FoodMenuItemCard extends StatelessWidget {
  final FoodMenuItem foodItem;
  final Function(FoodMenuItem) addToCart;

  const FoodMenuItemCard({
    required this.foodItem,
    required this.addToCart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          // Handle item tap if needed
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  foodItem.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${foodItem.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton.icon(
                onPressed: () => addToCart(foodItem),
                icon: const FaIcon(FontAwesomeIcons.cartPlus, size: 18),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color
                  shadowColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class FoodMenuItem {
  final String name;
  final double price;
  final String image;

  const FoodMenuItem({
    required this.name,
    required this.price,
    required this.image,
  });
}

final List<FoodMenuItem> foodItems = [
  FoodMenuItem(
    name: 'Biryani',
    price: 25,
    image: 'assets/biryani.jpeg',
  ),
  FoodMenuItem(
    name: 'Pizza',
    price: 15,
    image: 'assets/pizza.jpeg',
  ),
  FoodMenuItem(
    name: 'Burger',
    price: 10,
    image: 'assets/burger.jpeg',
  ),
  FoodMenuItem(
    name: 'Tea',
    price: 5,
    image: 'assets/tea.jpeg',
  ),
  FoodMenuItem(
    name: 'Coffee',
    price: 7,
    image: 'assets/coffee.jpg',
  ),
  FoodMenuItem(
    name: 'French Fries',
    price: 4,
    image: 'assets/frenchfries.jpg',
  ),
  FoodMenuItem(
    name: 'Burrito',
    price: 10,
    image: 'assets/burrito.jpg',
  ),
  FoodMenuItem(
    name: 'Taco\'s',
    price: 5,
    image: 'assets/tacos.jpg',
  ),
  FoodMenuItem(
    name: 'Chicken Nuggets',
    price: 8,
    image: 'assets/ChickenNuggets.jpg',
  ),
  FoodMenuItem(
    name: 'Quesadilla',
    price: 8,
    image: 'assets/qdilla.jpg',
  ),
  FoodMenuItem(
    name: 'Masala Dosa',
    price: 6,
    image: 'assets/masaladosa.jpg',
  ),
  FoodMenuItem(
    name: 'Poori',
    price: 7,
    image: 'assets/poori.jpg',
  ),
  FoodMenuItem(
    name: 'Lemon Rice',
    price: 9,
    image: 'assets/lemonrice.jpg',
  ),
  FoodMenuItem(
    name: 'Chicken Noodles',
    price: 10,
    image: 'assets/ChickenNoodles.jpg',
  ),
  FoodMenuItem(
    name: 'Egg Fried Rice',
    price: 15,
    image: 'assets/eggfriedrice.jpg',
  ),
  FoodMenuItem(
    name: 'Coke',
    price: 3,
    image: 'assets/coke.jpg',
  ),
  FoodMenuItem(
    name: 'Pepsi',
    price: 2.8,
    image: 'assets/pepsi.png',
  ),
  FoodMenuItem(
    name: 'Sprite',
    price: 3,
    image: 'assets/sprite.png',
  ),
  FoodMenuItem(
    name: 'Lemon Soda',
    price: 5,
    image: 'assets/lemonsoda.jpg',
  ),
  FoodMenuItem(
    name: 'Buttermilk',
    price: 3,
    image: 'assets/buttermilk.jpg',
  ),
  FoodMenuItem(
    name: 'Gulab Jamun',
    price: 5,
    image: 'assets/gulabjammon.jpeg',
  ),
  FoodMenuItem(
    name: 'Apricot Delight',
    price: 8,
    image: 'assets/appricotdelight.jpg',
  ),
];
