import 'package:interface_user/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'men.dart';
import 'women.dart';
import 'perfume.dart';
import 'aboutus.dart';
import 'home.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Here to Help",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text("Have a question? You may find an answer in our FAQs. But you can also contact us:"),
                        const SizedBox(height: 10),
                        const Text("Address:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 7),
                        const Text(" Unit XX, Phase X, USA Business Avenue, SITE area, Abcdefgh."),
                        const SizedBox(height: 10),
                        const Text("Whatsapp:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height:7 ),
                        const Text(" 0100-000111000"),
                        const SizedBox(height: 20),
                        const Text(
                          "Get in Touch",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text("We'd love to hear from you about our entire service. Your comments and suggestions will be highly appreciated. Please complete the form below."),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          maxLines: 5,
                          decoration: InputDecoration(labelText: "Comment", border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(onPressed: () {}, child: const Text("Submit")),
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
                        const SizedBox(height: 20),
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
          ),
        ],
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
