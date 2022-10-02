import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:livraison_app/bdd/classes.dart';

class DatabaseService {
  final String uid;
  static String? nom;
  static bool exist = false;
  static double? long, lat;
  static List<Panier>? list;
  static int nbrPanier = 0,  nbPlat = 0;

  DatabaseService({required this.uid});

  //Collectoin reference
  final CollectionReference clientCollection =
  FirebaseFirestore.instance.collection('Client');

//panier
  List<Panier> _panierList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Panier(
          id: doc.get("ID").toString(),
          nom: doc.get("nom").toString(),
          resId: doc.get("ResId").toString(),
          descreption: doc.get("description").toString(),
          prix: doc.get("prix").toInt(),
          categore: doc.get("categorie").toString(),
          quantite: doc.get("quentite").toInt(),
          message: doc.get("message".toString()));
    }).toList();
  }

  Stream<List<Panier>> get panier {
    return clientCollection
        .doc(uid)
        .collection("Panier")
        .snapshots()
        .map((snapshot) => _panierList(snapshot));
  }


  updatUserdata() {
    clientCollection.doc(uid).get().then((value) {
      if (!value.exists) {
        clientCollection.doc(uid).set(
            { "panier": 0.toInt()});
      }
    });
  }

  int _existpanier(DocumentSnapshot snapshot) {
    return snapshot.get("panier").toInt();
  }

  Stream<int> get existpanier {
    return clientCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _existpanier(snapshot));
  }
  //*******************************************************************************************
  String _Lenom(DocumentSnapshot snapshot) {
    return snapshot.get("nom").toString();
  }

  Stream<String> get Lenom {
    return clientCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _Lenom(snapshot));
  }
//********************************************************************************************



  Future updatePanier(Plat plat, int cont, String message) async {
    await clientCollection
        .doc(uid)
        .collection("Panier")
        .doc(plat.resId + "" + plat.id)
        .set({
      "nom": plat.nom,
      "description": plat.descreption,
      "prix": plat.prix,
      "ID": plat.id,
      "ResId": plat.resId,
      "categorie": plat.categore,
      "quentite": cont.toInt(),
      "message": message
    });
  }

  Future deletePanier(Panier panier) async {
    await clientCollection
        .doc(uid)
        .collection("Panier")
        .doc(panier.resId + "" + panier.id)
        .delete();
  }







  UpdatePanierPlus() async {
    await clientCollection
        .doc(uid)
        .get()
        .then((value) => nbrPanier = value.get("panier").toInt());

    await clientCollection.doc(uid).update({"panier": nbrPanier + 1});
  }

  UpdatePanierMoin() async {
    await clientCollection
        .doc(uid)
        .get()
        .then((value) => nbrPanier = value.get("panier").toInt());

    await clientCollection.doc(uid).update({"panier": nbrPanier - 1});
  }
  latitude(num n)async{
    await clientCollection.doc(uid).update({"latitude": n});

  }
  longitude(num n)async{
    await clientCollection.doc(uid).update({"longitude": n});
  }

  UpdatePlatPlus(String uid) async {
    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .get()
        .then((value) => nbPlat = value.get("quentite").toInt());

    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .update({"quentite": nbPlat + 1});
  }

  UpdatePlatMoin(String uid) async {
    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .get()
        .then((value) => nbPlat = value.get("quentite").toInt());

    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .update({"quentite": nbPlat - 1});
  }

  writeCommande(Location l) async {
    var dt = DateTime.now();
    String time;
    if (dt.hour < 10 && dt.minute < 10) {
      time = "0" + dt.hour.toString() + ":0" + dt.minute.toString();
    } else if (dt.hour < 10) {
      time = "0" + dt.hour.toString() + "0" + dt.minute.toString();
    } else if (dt.minute < 10) {
      time = dt.hour.toString() + ":0" + dt.minute.toString();
    } else {
      time = dt.hour.toString() + ":" + dt.minute.toString();
    }
    ;
    for (int i = 0; i < list!.length; i++) {
      await FirebaseFirestore.instance
          .collection('Commandes')
          .doc(uid + ":" + time.toString())
          .collection("commade")
          .add({
        "nom": list![i].nom,
        "description": list![i].descreption,
        "prix": list![i].prix,
        "ID": list![i].id,
        "ResId": list![i].resId,
        "categorie": list![i].categore,
        "quentite": list![i].quantite.toInt(),
        "message": list![i].message,
        "UserID": uid,
        "Latitude": l.latitude,
        "Longitude": l.longitude
      });
    }
  }
}
