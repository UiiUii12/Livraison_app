import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livraison_app/Ui/Restaurant.dart';

import 'package:livraison_app/bdd/classes.dart';

import '../Ui/Food.dart';

class RestauService {
  static String plasImage = "", foodImage = "", name = "";
  static List<Food> List_of_food =[];
  final CollectionReference restauCollection =
  FirebaseFirestore.instance.collection('Restaurant');

  List<String> _sugestion(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doc.get("ImageUrl").toString();
    }).toList();
  }

  Stream<List<String>> get sugestion {
    return restauCollection.snapshots().map((snapshot) => _sugestion(snapshot));
  }

  List<String> _promotion(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doc.get("ImageUrl").toString();
    }).toList();
  }

  Stream<List<String>> get promotion {
    return FirebaseFirestore.instance
        .collection('Promotion')
        .snapshots()
        .map((snapshot) => _promotion(snapshot));
  }

  List<Restaurant> _restaurantList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Restaurant(
          nom: doc.get("nom").toString(),
          longitude: doc.get("Longitude").toDouble(),
          imageUrl: doc.get("ImageUrl").toString(),
          latitude: doc.get("Latitude").toDouble(),
          id: doc.get("ID").toString(),
          phone: doc.get("phone").toString(),
          adress: doc.get("Adress").toString(),
          ImageUrl: doc.get("ImageUrl").toString(),
          state: doc.get("state"),);
    }).toList();
  }

  Stream<List<Restaurant>> get restaurantList {
    return restauCollection
        .snapshots()
        .map((snapshot) => _restaurantList(snapshot));
  }

  PartRestaurant _partRestau(DocumentSnapshot snapshot) {
    return PartRestaurant(
        nom: snapshot.get("nom"), imageUrl: snapshot.get("ImageUrl"));
  }

  Stream<PartRestaurant> partRestau(String uid) {
    return restauCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _partRestau(snapshot));
  }

  List<Plat> _categoreList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Plat(

          id: doc.get("ID").toString(),
          nom: doc.get("nom").toString(),
          resId: doc.get("ResId").toString(),
          descreption: doc.get("description").toString(),
          prix: doc.get("prix").toInt(),
          categore: doc.get("categorie").toString());
    }).toList();
  }

  Stream<List<Plat>> categoreList(String uid, String categorie) {
    return restauCollection
        .doc(uid)
        .collection(categorie)
        .snapshots()
        .map((snapshot) => _categoreList(snapshot));
  }

  List<String> _tabcate(DocumentSnapshot snapshot) {
    var t = snapshot.get("Categories");

    List<String> z = [];
    for (int i = 0; i < t.length; i++) {
      z.add(t[i].toString());
    }
    return z;
  }

  Stream<List<String>> tabcate(String id) {
    return restauCollection
        .doc(id)
        .snapshots()
        .map((snapshot) => _tabcate(snapshot));
  }

  getfoodImage(String cate) {
    if (cate == "Pizzas") {
      foodImage = "images/pizza.png";
    } else if (cate == "Burger") {
      foodImage = "images/burger.png";
    } else if (cate == "Tacos") {
      foodImage = "images/tacos.png";
    } else {
      foodImage = "images/chicken.png";
    }
  }



  String nom(String id) {
    restauCollection.doc(id).get().then((value) => name = value.get("nom"));

    return name;
  }
  writeCommande() async {


      await FirebaseFirestore.instance
          .collection('Plats')
          .add({
        "nom":'' ,
        "description":'' ,
        "prix": 0,
        "ID":' ',
        "ResId": 'bgxt0iCCvObcRvpNVsXz',
        "categorie":'Pizzas',


      });

  }
  List<Food> _foodlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Food(
          message: '',
          id: doc.get("ID").toString(),
          nom: doc.get("nom").toString(),
          resId: doc.get("ResId").toString(),
          descreption: doc.get("description").toString(),
          prix: doc.get("prix").toDouble(),
          categore: doc.get("categorie").toString(), quentite: 0,);

    }).toList();
  }

  Stream<List<Food>> foodlist() {
    return FirebaseFirestore.instance.collection('Plats')
        .snapshots()
        .map((snapshot) => _foodlist(snapshot));
  }
}
