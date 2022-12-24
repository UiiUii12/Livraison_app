
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:livraison_app/Ui/SearchScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Ui/Food.dart';
import '../Ui/OnBoarding_Pages.dart';
import '../Ui/Restaurant.dart';
import '../classes/categorie.dart';
import '../classes/promo.dart';
import '../classes/restaurant.dart';


class AppController extends GetxController {
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



  int page_index=0 ;

  final List<OnBoard> pages = [
    OnBoard(image: 'lib/Asset/Images/onBoardingImage1.png', title: "Le temps est précieux , n'est-ce pas?",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
    OnBoard(image: 'lib/Asset/Images/onBoardingImage2.png', title: "Un seul clic et vous avez terminé",
        description:
        "Le reste est sur nous, nous vous apportons vos aliments préférés") ,
    OnBoard(image: 'lib/Asset/Images/onBoardingImage3.png', title: "Nous somme là!",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
  ] ;

  List<Restaurant> restaurants = [


  ];
  List<Restaurant> restaurant = [


  ];
  List<Restaurant2> restaurant2 = [


  ];
  List<Food> Pizza = [


  ];

 List<Promo> promo = [
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
  ];


  void onchange (int index ){
    page_index =index ;
    update () ;
  }
  void increment(var counter , double prix , var cout_total) {
    counter.value <= 30 ? (){ counter++ ; cout_total.value = (cout_total.value)+  prix ;  }() : counter ;
    print(counter) ;
    update() ;
  }
  void decrement (var counter, double prix , var cout_total){
    counter.value >1 ? (){ counter-- ; cout_total.value = (cout_total.value)-  prix ;  } (): counter ;
    print(counter) ;
    update();
  }

  void Delete ( List<Food> cart , Food food , var cout_total ){
    Get.snackbar(
        'Supprimer', 'Cet élément a été supprimé' ,
        duration: Duration(seconds: 3) ,
        snackPosition: SnackPosition.BOTTOM ,
        backgroundColor: Color(0xffE4E4E4)
    ) ;
    cout_total.value = cout_total.value - food.prix * food.counter.value ;
    update() ;

  }
  void Remove_from_cart(List<Food> cart , Food food) {
    cart.remove(food) ;
    update() ;
  }
  void sug( List<Restaurant> list1,  String s) {
    List<Restaurant> l = [];

    for (var i in list1) {
      if (i.nom.contains(s)) {
        l.add(i);
      }
    }
    list1=l;

    SearchScreen.lo=list1;
    update();
  }
  void sug2( List<Food> list1,  String s) {
    List<Food> l = [];

    for (var i in list1) {
      if (i.nom.contains(s)) {
        l.add(i);
      }
    }
    list1=l;

    SearchScreen.li=list1;
    update();
  }
  void j(){}



  @override
  void onInit() {

    controller = PageController(initialPage: 0) ;

    super.onInit();
  }
  @override
  void onClose() {
    controller.dispose() ;

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

