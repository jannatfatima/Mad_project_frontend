import 'package:interface_user/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:interface_user/utils/app_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'signin.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Center(
           child:   Text("Sign up now ", style: TextStyle(color: AppConstant.appMainColor ,
               fontSize: 30,fontWeight: FontWeight.bold), ),
          ),
          const SizedBox(height: 8,),
          Center(
            child:   Text("please fill the details and create account", style: TextStyle(color: Colors.grey.shade700 ,
                fontSize: 15,  ),
          ),),


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
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey.shade700),
                  hintText: 'Email',
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
              const SizedBox(height: 15),
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
              const SizedBox(height: 8),
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
                    backgroundColor: AppConstant.appMainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),

                  child: const Text('Sign up', style: TextStyle(color: Colors.white ,fontSize: 16)),
                ),
              ),
               const SizedBox(height: 10,),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Signin(), ));
                  },
                  child: const Text(
                    'already have an account? Sign In',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
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
