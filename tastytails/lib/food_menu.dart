import 'package:flutter/material.dart';
import 'package:tastytails/cartpage.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({Key? key}) : super(key: key);

  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
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
        title: Text('Food Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FoodMenuItem(
            name: 'Biryani',
            price: '\$25',
            image: 'assets/biryani.jpeg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Pizza',
            price: '\$15',
            image: 'assets/pizza.jpeg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Burger',
            price: '\$10',
            image: 'assets/burger.jpeg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Tea',
            price: '\$5',
            image: 'assets/tea.jpeg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Coffee',
            price: '\$7',
            image: 'assets/coffee.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'French Fries',
            price: '\$4',
            image: 'assets/frenchfries.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Burrito',
            price: '\$10',
            image: 'assets/burrito.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Taco\'s',
            price: '\$5',
            image: 'assets/tacos.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Chicken Nuggets',
            price: '\$8',
            image: 'assets/ChickenNuggets.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Quesadilla',
            price: '\$8',
            image: 'assets/qdilla.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Masala Dosa',
            price: '\$6',
            image: 'assets/masaladosa.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Poori',
            price: '\$7',
            image: 'assets/poori.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Lemon Rice',
            price: '\$9',
            image: 'assets/lemonrice.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Chicken Noodles',
            price: '\$10',
            image: 'assets/ChickenNoodles.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Egg Fried Rice',
            price: '\$15',
            image: 'assets/eggfriedrice.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Coke',
            price: '\$3',
            image: 'assets/coke.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Pepsi',
            price: '\$2.8',
            image: 'assets/pepsi.png',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Sprite',
            price: '\$3',
            image: 'assets/sprite.png',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Lemon Soda',
            price: '\$5',
            image: 'assets/lemonsoda.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Buttermilk',
            price: '\$3',
            image: 'assets/buttermilk.jpg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Gulab Jamun',
            price: '\$5',
            image: 'assets/gulabjammon.jpeg',
            addToCart: addToCart,
          ),
          FoodMenuItem(
            name: 'Apricot Delight',
            price: '\$8',
            image: 'assets/appricotdelight.jpg',
            addToCart: addToCart,
          ),
        ],
      ),
    );
  }
}

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
              onPressed: () => addToCart(this),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
