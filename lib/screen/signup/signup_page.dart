


import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
   SignUpPage({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

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
              borderRadius: BorderRadius.circular(20),
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
                  //name field
                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your name";
                      }else{
                        return null;
                      }
                    },
                    controller:nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your name here",
                      hintStyle: TextStyle(),
                      labelText: "Name",
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),

                  SizedBox(height: 11),

                  //email field
                  TextFormField(
                    validator: (value){
                      final bool emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "");

                      if (value == null || value.isEmpty) {
                        return "please enter your email";
                      } else if (!emailRegex) {
                        return "please enter valid email";
                      } else {
                        return null;
                      }
                    },

                    controller:emailController,

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
                  // mobile number
                  TextFormField(

                    validator: (value){

                      if(value == null || value.isEmpty){
                        return "please enter mobile number";
                      }
                      if(value.length != 10){
                        return "please 10 digit mobile number";
                      }
                      return null;
                    },
                    controller: numberController,
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
                  //password
                  StatefulBuilder(
                    builder: (context,ss) {
                      return TextFormField(
                        validator:(value){

                          final bool passwordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value ?? "");

                          if(value == null || value.isEmpty){
                            return "please enter your password";
                          }else if(passwordValid){
                            return "please enter valid password";
                          }else {
                            return null;
                          }

                        },
                        controller:passwordController,
                        decoration: InputDecoration(
                          hintText: "Enter your password here",
                          hintStyle: TextStyle(),
                          labelText: "password",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      );
                    }
                  ),

                  SizedBox(height: 11),

                  //Confirm Password
                  TextFormField(

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please retype your password";
                        } else if (passwordController.text != value) {
                          return "password doesn't match ";
                        } else {
                          return null;
                        }
                      },
                    controller:confirmController,
                     decoration: InputDecoration(
                      hintText: "Enter your ConfirmPassword here",
                      hintStyle: TextStyle(),
                      labelText: "ConfirmPassword",
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),

                  SizedBox(height: 11),
                  ///ElevatedButton
                  SizedBox(
                      width:double.infinity,
                      child: ElevatedButton(onPressed: () {}, child: Text("Log in"))),
                  ///user Msg
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("if already have an account",
                          style: TextStyle(color: Colors.white),
                        ),

                        SizedBox(width: 5),

                        Text("Login Now",
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
      )
    );
  }

}