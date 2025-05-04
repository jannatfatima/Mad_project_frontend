import 'package:interface_user/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Home.dart';
import 'women.dart';
import 'perfume.dart';
import 'contact.dart';
import 'aboutus.dart';
import 'detail_product.dart';
import 'cart_page.dart';
import 'package:url_launcher/url_launcher.dart';
class Men extends StatefulWidget {
  const Men({super.key});

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredProducts = [];
  List<dynamic> products = [];
  final Map<String, bool> _isHovered = {
    "Home": false,
    "Men's": false,
    "Women's": false,
    "Perfume": false,
    "Contact": false,
    "About Us": false,
  };
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    super.initState();
    fetchProducts();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      filteredProducts = products.where((product) {
        String title = product["title"].toString().toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  // Function to Fetch Data from API
  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("http://127.0.0.1:3001/shop_product/male"));

      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
          filteredProducts = products; // initialize with all products
        });
      } else {
        print("Failed to load products. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Increased height for navbar
        child: Column(
          children: [
            AppBar(
              backgroundColor: AppConstant.appMainColor,
              centerTitle: true,
              title: const Column(
                children: [
                  Text(
                    "Free shipping on all orders",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Limited-time offer",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    height: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60 ),
                      child:   TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),


                    ),
                  ),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.receipt_long, color: AppConstant.appMainColor), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.account_balance_wallet, color: AppConstant.appMainColor), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.shopping_cart, color: AppConstant.appMainColor), onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CartPage()),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // Navigation Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 2, color: Colors.grey.shade300),
                bottom: BorderSide(width: 2, color: Colors.grey.shade300),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(context, "Home", const Home()),
                _navItem(context, "Men's", const Men()),
                _navItem(context, "Women's", const Women()),
                _navItem(context, "Perfume", const Perfume()),
                _navItem(context, "Contact", const Contact()),
                _navItem(context, "About Us", const Aboutus()),
              ],
            ),
          ),

          // Content with Footer
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child:  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(filteredProducts[index]);
                      },
                    ),

                  ),

                  // Footer Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: AppConstant.appMainColor,
                    child: Column(
                      children: [
                        const Text(
                          "Thank you for visiting our shop!",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Shop your heart out with shopko,, your one-stop online marketplace for everything you need, from fashion and electronics to home goods and groceries. Discover exclusive deals, browse curated collections, and enjoy fast, convenient delivery right to your doorstep - all at your fingertips!",
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Follow us on social media for more updates.",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Facebook Icon
                            IconButton(
                              icon: const Icon(Icons.facebook_rounded, color: Colors.white, size: 30, ),
                              onPressed: () => _launchURL('https://www.facebook.com/'),
                            ),

                            const SizedBox(width: 20), // Space between icons

                            // Instagram Icon
                            IconButton(
                              icon: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 30), // Placeholder for Insta
                              onPressed: () => _launchURL('https://www.instagram.com/'),
                            ),

                            const SizedBox(width: 20),

                            // Twitter Icon
                            IconButton(
                              icon: const Icon(Icons.alternate_email_rounded, color: Colors.white, size: 30), // Placeholder for Twitter
                              onPressed: () => _launchURL('https://www.twitter.com/'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "© 2025 Your Shop Name - All Rights Reserved",
                          style: TextStyle(fontSize: 12, color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  // Function to Build Navigation Bar Items
  Widget _navItem(BuildContext context, String title, Widget page) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered[title] = true),
      onExit: (_) => setState(() => _isHovered[title] = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _isHovered[title]! ? AppConstant.secondaryColor : Colors.black, // Change color on hover
                decoration: _isHovered[title]! ? TextDecoration.underline : TextDecoration.none, // Underline on hover
              ),
            ),
          ],
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  // Function to Build Product Cards
  Widget _buildProductCard(dynamic product) {
    double rating = product["rating"] ?? 0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  product['image'].toString().trim(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // If image is loaded, return it
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.red));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["title"],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product["description"],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product["price"]}",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                  ),

                  // Rating Row
                  Row(
                    children: [
                      for (int i = 0; i < fullStars; i++) const Icon(Icons.star, color: Colors.yellow, size: 16),
                      if (hasHalfStar) const Icon(Icons.star_half, color: Colors.yellow, size: 16),
                      for (int i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++)
                        const Icon(Icons.star_border, color: Colors.yellow, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

