import 'package:flutter/material.dart';
import 'package:livraison_app/view/AdresseScreen.dart';
import 'package:livraison_app/view/HomeScreen.dart';
import 'package:livraison_app/view/LoginScreen.dart';
import 'package:livraison_app/view/MesCommandes.dart';
import 'package:livraison_app/view/OTPScreen.dart';
import 'package:livraison_app/view/OrderConfirmer.dart';
import 'package:livraison_app/view/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
     // home:LoginScreen(),
      routes: {
        '/': (context) =>  LoginScreen(),
        '/otp': (context) =>  OTPScreen(),
        '/adresse':(context)=>AdresseScreen(),
        '/welcome':(context)=>WelcomeScreen(),
        '/orderconfirmer':(context)=>OrderConfirmerScreen(),
        '/mescommandes':(context)=>MesCommandes(),
        '/home':(context)=>Home(),
      },
    );
  }
}
