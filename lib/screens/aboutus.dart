import 'package:interface_user/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'men.dart';
import 'women.dart';
import 'perfume.dart';
import 'home.dart';
import 'contact.dart';

class Aboutus extends StatefulWidget {
  const Aboutus ({super.key});

  @override
  State<Aboutus > createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List<dynamic> products = [];
  final Map<String, bool> _isHovered = {
    "Home": false,
    "Men's": false,
    "Women's": false,
    "Perfume": false,
    "Contact": false,
    "About Us": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.grey.shade300),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About our Online Shop", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    "Shopping is the Online Retail Shopping Store in Pakistan with Cash On Delivery. We deal in Fancy Kitchen Items, Household items, Electronics, Travel accessories, Baby Products & more. We offer not only the product on sale but also the most efficient service and prices which are unimaginably economic in order to keep customers' satisfaction the first priority.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text("Customer Support Service", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    "Our goal has always been on helping our customers save time and money. Homazing values the trust that our customers, associates, representatives, and service providers place in us. This is why we’ve invested in creating an e-commerce platform that allows you to order your desired product and endeavor to manage personal information in accordance with our core value of respect for the individual.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text("Product Range", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    "E-commerce is a more preferable option due to its convenience and benefit of providing a vast range of products in one go. Homazing completely understands this and offers an online store with a large collection of products under all possible categories. From an impressive range of Crockery and Household products to fashion couture and makeup, Homazing caters to every customer's needs. There is something for everyone here!",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
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
                    "Shop your heart out with [App Name], your one-stop online marketplace for everything you need, from fashion and electronics to home goods and groceries. Discover exclusive deals, browse curated collections, and enjoy fast, convenient delivery right to your doorstep - all at your fingertips!",
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Follow us on social media for more updates.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(icon: const Icon(Icons.facebook, color: Colors.white), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.camera, color: Colors.white), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.facebook_rounded, color: Colors.white), onPressed: () {}),
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
    );
  }

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
                color: _isHovered[title]! ? AppConstant.secondaryColor : Colors.black,
                decoration: _isHovered[title]! ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
