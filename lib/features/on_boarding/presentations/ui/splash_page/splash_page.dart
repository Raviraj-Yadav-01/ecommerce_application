
import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
const SplashPage({super.key});

@override
State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


 @override
  void initState() {
    super.initState();
   Timer(Duration(seconds:5, milliseconds:50),(){
   Navigator.pushReplacementNamed(context, AppRoutes.login);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              // backgroundImage: AssetImage("asset/image/1695133307094.jpg"),
              backgroundImage: AssetImage("assets/images/Article_e-com_sep-1.jpg"),
            ),
            SizedBox(height:5),
            Text("Ecommerce app",style:TextStyle(fontSize:22,fontWeight:FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
