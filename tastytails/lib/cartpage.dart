//cartpage.dart
import 'package:flutter/material.dart';
import 'package:tastytails/checkoutpage.dart';
import 'package:tastytails/food_menu.dart';

class CartPage extends StatefulWidget {
  final List<FoodMenuItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<FoodMenuItem, int> itemQuantityMap = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.cartItems) {
      if (itemQuantityMap.containsKey(item)) {
        itemQuantityMap[item] = itemQuantityMap[item]! + 1;
      } else {
        itemQuantityMap[item] = 1;
      }
    }
  }

  double get totalPrice {
    return itemQuantityMap.entries.fold<double>(0.0, (double sum, MapEntry<FoodMenuItem, int> entry) {
      return sum + (entry.key.price * entry.value);
    });
  }

  void removeItem(FoodMenuItem item) {
    setState(() {
      if (itemQuantityMap[item]! > 1) {
        itemQuantityMap[item] = itemQuantityMap[item]! - 1;
      } else {
        itemQuantityMap.remove(item);
      }
    });
  }

  void addItem(FoodMenuItem item) {
    setState(() {
      if (itemQuantityMap.containsKey(item)) {
        itemQuantityMap[item] = itemQuantityMap[item]! + 1;
      } else {
        itemQuantityMap[item] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: itemQuantityMap.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: itemQuantityMap.length,
                    itemBuilder: (context, index) {
                      var item = itemQuantityMap.keys.elementAt(index);
                      var quantity = itemQuantityMap[item]!;
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                            'Price: \$${(item.price * quantity).toStringAsFixed(2)} '
                            '($quantity x \$${item.price.toStringAsFixed(2)})'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                removeItem(item);
                              },
                            ),
                            Text('$quantity'),
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                addItem(item);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(),
                            ),
                          );
                        },
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
