import 'package:flutter/material.dart';
import 'package:interface_user/utils/app_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'signup.dart';
class Signin extends StatefulWidget {
  const Signin({super.key});



  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true; //
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),

        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          const Center(
            child:   Text("Sign in now ", style: TextStyle(color: AppConstant.appMainColor ,
                fontSize: 30,fontWeight: FontWeight.bold), ),
          ),
          const SizedBox(height: 12,),
          Center(
            child:   Text("Please sign in to continue our app ", style: TextStyle(color: Colors.grey.shade700 ,
              fontSize: 15,  ),
            ),),
          const SizedBox(height: 13,),

          Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.grey.shade700),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),


                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,  // Use a state variable
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.grey.shade700),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        // Add suffix icon for visibility toggle
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility_off : Icons.visibility,  // Toggle icon
                            color: Colors.grey.shade700,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;  // Toggle password visibility
                            });
                          },
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?',
                            style: TextStyle(color: AppConstant.secondaryColor)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Sign-In Successful, Navigate to HomeScreen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const Home(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppConstant.appMainColor,
                          //foregroundColor: Color(0xFF388E3C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: const Text('Sign in', style: TextStyle(color: Colors.white ,fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(), ));
                        },
                        child: const Text(
                          'Do not have an account? Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center icons
                      children: [
                        // Facebook Icon
                        IconButton(
                          icon: const Icon(Icons.facebook_rounded, color: Colors.blue, size: 30, ),
                          onPressed: () => _launchURL('https://www.facebook.com/'),
                        ),

                        const SizedBox(width: 20), // Space between icons

                        // Instagram Icon
                        IconButton(
                          icon: const Icon(Icons.camera_alt_rounded, color: Colors.pink, size: 30), // Placeholder for Insta
                          onPressed: () => _launchURL('https://www.instagram.com/'),
                        ),

                        const SizedBox(width: 20),

                        // Twitter Icon
                        IconButton(
                          icon: const Icon(Icons.alternate_email_rounded, color: Colors.lightBlue, size: 30), // Placeholder for Twitter
                          onPressed: () => _launchURL('https://www.twitter.com/'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),)

          //Please sign in to continue our app
        ],
      ),
    );
  }
}

