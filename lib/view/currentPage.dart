
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:livraison_app/classes/Category.dart';
import 'package:livraison_app/view/MesCommandes.dart';
import 'package:livraison_app/view/PanierVide.dart';
import 'CartScreen.dart';
import 'package:livraison_app/View/Food.dart';
import 'HomeScreen.dart';
import 'SearchScreen.dart';
import 'Vide.dart';


class Main_Page extends StatefulWidget {
  Main_Page({Key? key}) : super(key: key);
  static  int currentindex =0 ;
  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  List interfaces = [ Home(),SearchScreen() ,  CartScreen(cart:<Food>[].obs, category:<Category>[].obs, inisial_price: 0,)  ,MesCommandes() ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: interfaces[Main_Page.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type : BottomNavigationBarType.fixed ,
        onTap : (int index){
          setState (() {
            Main_Page.currentindex=index;
          }
          );
        } ,
        backgroundColor: Colors.white,
        currentIndex : Main_Page.currentindex ,
        selectedItemColor: Color(0xffE6424B),
        unselectedItemColor: Color(0xffADADAD),
        elevation: 8.0,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Golos',
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
               EvaIcons.homeOutline
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
              icon: Icon(
               EvaIcons.searchOutline
              ),
              label:'Recherche'
          ),
          BottomNavigationBarItem(
            icon: Icon(
                EvaIcons.shoppingCartOutline
            ),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.personOutline
              ),
              label: 'Compte'
          ),

        ],
      ),
    ));
  }
}