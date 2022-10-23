
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:livraison_app/classes/plat.dart';
import 'package:livraison_app/classes/promotion.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/categorie.dart';
import '../classes/commande.dart';
import '../classes/promo.dart';
import '../classes/restaurant.dart';

class AppController extends GetxController{
   late PageController controller ;
   final Uri _number = Uri.parse('tel:+213556000010');
   bool codeTrue=true;
   bool submitLogin=false;
   bool submitAdresse=false;
   bool submitOTP=false;
   bool submit1=false;
   bool submit2=false;
   bool submit3=false;
   bool submit4=false;
   bool submit5=false;
   bool submit6=false;
   final phoneNumber= new TextEditingController();
   final Adresse= new TextEditingController();
   final digitCode1=new TextEditingController();
   final digitCode2=new TextEditingController();
   final digitCode3=new TextEditingController();
   final digitCode4=new TextEditingController();
   final digitCode5=new TextEditingController();
   final digitCode6=new TextEditingController();

  static List<Color> ColorsPromo = [
    Color(0xffE6424B),
    Color(0xff3F3D56),
    Color(0xfff9a825),
    Color(0xffff6584),
    Color(0xff8b4e56),
    Color(0xff6b667c),
    Color(0xffe1e0e1)
  ];
  static var ind=Random();

  List<Restaurant> restaurants = [
    new Restaurant(image:'assets/images/plat.png',name: 'Magic Pizza', categories:[Category([],'Pizza', 'assets/pizza.svg'),Category([],'Chiken', 'assets/pizza.svg'),Category([],'Burger', 'assets/pizza.svg')],
        state: true,localisation: 'Akid Lotfi , ORAN'),
    new Restaurant(image:'assets/images/plat.png',name: 'Magic Pizza', categories:[Category([],'Pizza','assets/pizza.svg' )],
        state: true,localisation: 'Akid Lotfi , ORAN'),
    new Restaurant(image:'assets/images/plat.png',name: 'Magic Pizza', categories:[Category([],'Pizza','assets/pizza.svg' )],
        state: true,localisation: 'Akid Lotfi , ORAN'),
  ];

  List<Promotion> promotion = [
    new Promotion(image: 'assets/images/promo1.png', nameRestaurant:'Pizza | Street 22',offre: 'Achetez 1,obtenez- 1 gratuitement', descriptionOffre: 'Pizza géante: poulet et viande hachée'),
    new Promotion(image: 'assets/images/promo1.png', nameRestaurant:'Pizza | Street 22',offre: 'Achetez 1,obtenez- 1 gratuitement', descriptionOffre: 'Pizza géante: poulet et viande hachée'),
    new Promotion(image: 'assets/images/promo1.png', nameRestaurant:'Pizza | Street 22',offre: 'Achetez 1,obtenez- 1 gratuitement', descriptionOffre: 'Pizza géante: poulet et viande hachée'),
    new Promotion(image: 'assets/images/promo1.png', nameRestaurant:'Pizza | Street 22',offre: 'Achetez 1,obtenez- 1 gratuitement', descriptionOffre: 'Pizza géante: poulet et viande hachée'),
  ];
  final List<Promo> promo = [
    new Promo('assets/images/promo1.png','Pizza | Street 22','Achetez 1,obtenez- 1 gratuitement','Pizza géante: poulet et viande hachée'),
    new Promo('assets/images/promo1.png','Pizza | Street 22','Achetez 1,obtenez- 1 gratuitement','Pizza géante: poulet et viande hachée'),
    new Promo('assets/images/promo1.png','Pizza | Street 22','Achetez 1,obtenez- 1 gratuitement','Pizza géante: poulet et viande hachée'),
    new Promo('assets/images/promo1.png','Pizza | Street 22','Achetez 1,obtenez- 1 gratuitement','Pizza géante: poulet et viande hachée'),
  ];

  List<Category> Categ = [
    Category([],'Pizza','assets/pizza.svg',),
    Category([],'Soup','assets/soup.svg',),
    Category([],'Sandwich','assets/sandwich.svg',),
    Category([],'Drink','assets/drink.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
    Category([],'Burger','assets/sandwich.svg',),
  ];

 /* List<Plat> p = [
    new Plat(
        'Pizza Poulet', 'Fromage, Poulet , Sauce rouge', 'Pizza', 400, 1),
    new Plat('Cocacola', '1Lettre', 'Boisson', 100, 2),
  ];
  Commande c1 = new Commande('Magic pizza', '16 juin', 'En cours', p);
  Commande c2 = new Commande('Magic pizza', '13 juin', 'Prête', p);
  Commande c3 = new Commande('Magic pizza', '3 mars', 'En cours', p);
  Commande c4 = new Commande('Magic pizza', '9 février', 'Prête', p);
  List commandes = [c1, c2, c3, c4];*/

  @override
  void onInit() {
    controller = PageController(initialPage: 0) ;
    super.onInit();
  }
  void onClose(){
    controller.dispose;
    super.onClose();
  }
 void onSubmitLogin() {
      submitLogin=phoneNumber.text.length==9;
      update();
  }
  void onSubmitOTP() {
    submit1=digitCode1.text.isNotEmpty;
    submit2=digitCode2.text.isNotEmpty;
    submit3=digitCode3.text.isNotEmpty;
    submit4=digitCode4.text.isNotEmpty;
    submit5=digitCode5.text.isNotEmpty;
    submit6=digitCode6.text.isNotEmpty;
    update();
  }
  void onSubmitAdresse() {
    submitAdresse=Adresse.text.isNotEmpty;
    update();
  }
  void onInDirectCall()async {
    if (!await launchUrl(_number))
      throw 'Could not launch $_number';
    update();
  }
  void onAddPromoToCart(RxBool ajoute){
    ajoute.value=!ajoute.value;
    update();
  }

}