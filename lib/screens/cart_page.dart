// cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Import the Cart class
import 'package:interface_user/utils/app_constant.dart';
import 'checkout.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart",style: TextStyle(color: Colors.white),),
        backgroundColor:  AppConstant.appMainColor
      ),
      body: cart.itemCount == 0
          ? Center(child: Text("Your cart is empty."))
          : ListView.builder(
        itemCount: cart.itemCount,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.network(item["image"], width: 50, height: 50),
            title: Text(item["title"]),
            subtitle: Text("\$${item["price"]}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                cart.removeItem(index); // Remove item from cart
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: AppConstant.appMainColor,
              ),
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}