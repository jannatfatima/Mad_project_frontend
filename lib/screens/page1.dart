import 'package:flutter/material.dart';
import 'package:interface_user/utils/app_constant.dart';
import 'page2.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 2, // Set height to half of the screen
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage('assets/page1.webp'),
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
          ),     const SizedBox(height:25),
          const Text.rich(
            TextSpan(
              text: "Life is Short and the \n world is ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
              children: [
                TextSpan(
                  text: "wide", // Spanned word
                  style: TextStyle(
                    color: AppConstant.secondaryColor, // Change color to orange
                    fontSize: 31, // Slightly bigger
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,

          ),

          const SizedBox(height:15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(" Welcome to our online shopping destination, where convenience meets variety! Our website is designed to bring you a seamless and enjoyable shopping experience from the comfort of your home.  ", style: TextStyle(
              color: Colors.grey.shade700

            ),textAlign: TextAlign.center,),
          ), const SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 200),
            child: Row(
              children: [
                Expanded(
                  child: Container(

                    height: 6,
                    color: AppConstant.appMainColor, // Active State
                  ),
                ),
                const SizedBox(width: 5),

                Expanded(
                  child: Container(
                    height: 6,

                    color: Colors.grey.shade300, // Inactive State
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 6,

                    color: Colors.grey.shade300, // Inactive State
                  ),
                ),
              ],
            ),
          ),
           const SizedBox( height: 20,),
          Center(
            child: ElevatedButton(

                onPressed:  (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const Page2(),
                    ),
                  );
                },
              style: ElevatedButton.styleFrom(
            backgroundColor: AppConstant.appMainColor,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 150, vertical: 20),
            ), child: const Text(" Get Start",
            style: TextStyle(color: Colors.white),),),
          )

        ],

      ),

    );
  }
}
