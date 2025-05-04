import 'package:interface_user/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Import the cart page
import 'checkout.dart'; // Add this line at the top of detail_product.dart

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double rating = product["rating"] ?? 0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product["title"], style: const TextStyle(color: Colors.white)),
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product["image"] ?? "https://via.placeholder.com/150",
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product["title"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product["description"],
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Text(
              "\$${product["price"]}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),

            // Rating Row
            Row(
              children: [
                for (int i = 0; i < fullStars; i++) const Icon(Icons.star, color: Colors.yellow, size: 20),
                if (hasHalfStar) const Icon(Icons.star_half, color: Colors.yellow, size: 20),
                for (int i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++)
                  const Icon(Icons.star_border, color: Colors.yellow, size: 20),
                const SizedBox(width: 5),
                Text(rating.toStringAsFixed(1), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),

            const Spacer(),

            // Add to Cart Button
            // Inside ProductDetail class
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add product to cart
                  Provider.of<Cart>(context, listen: false).addItem(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  // Navigate to Checkout Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: AppConstant.appMainColor,
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
