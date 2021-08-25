import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/pages/Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => HomePage()))
                                                         
         );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Container(
        child:Center(child: Image.asset("assets/image/splash.png",fit:BoxFit.cover))),
      
    );
  }
}