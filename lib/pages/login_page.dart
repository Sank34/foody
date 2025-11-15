import 'package:flutter/material.dart';
import 'package:foody/components/button.dart';

import '../components/text_field.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login logic
  void login() {
    /*
      auth logic
     */

    //navigate to homepage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: 100.0,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(height: 25,),

          //message, app slogan
          Text("Food Delivery App", style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),

          const SizedBox(height: 25,),

          //email textfield
          CustomTextField(
            controller: emailController,
            hintText: "Email",
            obscureText: false,
          ),

          const SizedBox(height: 10,),

          //password textfield
          CustomTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),

          const SizedBox(height: 10,),

          //sign in button
          CustomButton(
            onTap: login,
            text: "Sign In",
          ),

          const SizedBox(height: 25.0,),

          //register button + text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(width: 4,),
              GestureDetector(
                onTap: widget.onTap,
                child: Text("Register now!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
