import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/pages/Homepage.dart';
import 'package:movieapp/pages/Moviedetail.dart';
import 'package:movieapp/pages/SplashPage.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
  MyApp());
    
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.quicksand().fontFamily
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
       routes: {
        
          HomePage.routName:(context)=>HomePage(),
      }, 
      
    );
  }
}
