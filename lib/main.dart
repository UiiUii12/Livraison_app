import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:livraison_app/view/AdresseScreen.dart';
import 'package:livraison_app/view/HomeScreen.dart';
import 'package:livraison_app/view/LoginScreen.dart';
import 'package:livraison_app/view/OTPScreen.dart';
import 'package:livraison_app/view/OrderConfirmer.dart';
import 'package:livraison_app/view/WelcomeScreen.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}
String code="";
String a = "", b = "", c = "", d = "", e = "", f = "";
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: ( context, Widget? child) {
    return GetMaterialApp(
    theme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    //primarySwatch: Colors.blue,
    ),
    routes: {
    '/': (context) => LoginScreen(),
    '/home': (context) => Home(),
    '/otp': (context) => OTPScreen(),
    '/adresse': (context) => AdresseScreen(),
    '/welcome': (context) => WelcomeScreen(),
    '/orderconfirmer': (context) => OrderConfirmerScreen(),
    //'/mescommandes': (context) => MesCommandes(),
    },
    );});
  }}

