import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_application/app_constraints/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController;
  var passwordController = TextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
            image: AssetImage("assets/images/Article_e-com_sep-1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ), //color:Colors.white.withOpacity(0.5),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.blue.withOpacity(0.5),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email here",
                        hintStyle: TextStyle(),
                        labelText: "email",
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),

                    SizedBox(height: 11),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your password here",
                        hintStyle: TextStyle(),
                        labelText: "password",
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),

                    SizedBox(height: 11),

                    SizedBox(
                      width:double.infinity,
                        child: ElevatedButton(onPressed: () {}, child: Text("Log in"))),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("if not registered ",
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(width: 5),

                          Text("Create Now",
                            style: TextStyle(color: Colors.red),
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
      ),
    );
  }
}
