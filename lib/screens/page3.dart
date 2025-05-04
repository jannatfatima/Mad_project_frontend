import 'package:flutter/material.dart';
import 'package:interface_user/utils/app_constant.dart';
import 'signup.dart';
class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
                image:  AssetImage( "assets/page3.jpg"),
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
          ),     const SizedBox(height:25),
          const Text.rich(
            TextSpan(
              text: " Best Prices ",
              style: TextStyle(
                color: AppConstant.appMainColor,
                fontSize: 31,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),

            ),
            textAlign: TextAlign.center,

          ),

          const SizedBox(height:15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(" Welcome to our online shopping destination, where convenience meets variety! Our website is designed to bring you a seamless and enjoyable shopping experience from the comfort of your home.  ", style: TextStyle(

            color: Colors.grey.shade700

            ),textAlign: TextAlign.center,),
          ),
          const SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 200),
            child: Row(
              children: [
                Expanded(
                  child: Container(

                    height: 6,
                    color: Colors.grey.shade300, // Active State
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

                    color: AppConstant.appMainColor // Inactive State
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
                    builder: (context) =>  const Signup(),
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
              ), child: const Text(" Next",
              style: TextStyle(color: Colors.white),),),
          )

        ],

      ),

    );
  }
}
