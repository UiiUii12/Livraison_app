
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livraison_app/Ui/SearchScreen.dart';
import '../Ui/Food.dart';
import '../Ui/OnBoarding_Pages.dart';
import '../Ui/Restaurant.dart';
class AppController extends GetxController {

  late PageController controller ;

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
  List<Food> Pizza = [


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
print('coooooooooooocooooooooooooooooooo');
    print(list1.length);
    for (var i in list1) {
      print(s);
      print(i.nom);
      if (i.nom.contains(s)) {
        print("done");
        l.add(i);
      }
    }
    list1=l;
    print('hoooooolaaaaaaaaaaa');
    print(list1.length);
    SearchScreen.lo=list1;
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

}