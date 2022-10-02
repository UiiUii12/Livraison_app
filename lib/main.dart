import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livraison_app/Ui/OnBoardingScreen.dart';
import 'package:livraison_app/Wrappers/wrapper.dart';
import 'package:livraison_app/auth/auth.dart';
import 'package:livraison_app/auth/user.dart';
import 'package:livraison_app/bdd/restauinfo.dart';
import 'package:livraison_app/view/AdresseScreen.dart';
import 'package:livraison_app/view/HomeScreen.dart';
import 'package:livraison_app/view/LoginScreen.dart';
import 'package:livraison_app/view/MesCommandes.dart';
//import 'package:livraison_app/view/OTPScreen.dart';
import 'package:provider/provider.dart';
import 'package:livraison_app/view/OrderConfirmer.dart';
import 'package:livraison_app/view/WelcomeScreen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamProvider<MyUser?>.value(
    value: AuthService().user,
    initialData: null,

    catchError: (e, i) => null,
      child: ScreenUtilInit(
            designSize: const Size(428 , 926),
            builder: ( context, Widget? child) { return GetMaterialApp(

            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
              primaryColor: const Color(0xffE6424B),
              backgroundColor: Colors.white ,
            ),
           // home:LoginScreen(),
            initialRoute: 'wrapper',
            routes: {
              '/OnBoardingScreen':(context) =>  OnBoardingScreen(),
              'wrapper':(context) =>Wrapper(),
            '/': (context) =>  LoginScreen(),
              //'/otp': (context) =>  OTPScreen(),
              '/adresse':(context)=>AdresseScreen(),
              '/welcome':(context)=>WelcomeScreen(),
              '/orderconfirmer':(context)=>OrderConfirmerScreen(),
              '/mescommandes':(context)=>MesCommandes(),
              '/home':(context)=>Home(),
            },
          );}
        ));

  }
}
