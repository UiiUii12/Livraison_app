import 'package:livraison_app/classes/plat.dart';

class Commande{
  Commande(String restaurant,String date,String etat,List<Plat> plats){
    this.restaurant=restaurant;
    this.date=date;
    this.etat=etat;
    this.plats=plats;
  }
  late String restaurant;
  late String date;
  late String etat;
  late List<Plat> plats;
  double coutPartiel(){
    double somme=0;
    for(int i=0;i<plats.length;i++){
      somme=somme+plats[i].prix;
    }
    return somme;
  }
  double coutTotal(){
      return coutPartiel()+500;
  }
  @override
  String toString(){
    return this.date+' '+this.etat;
  }


}