import 'commande.dart';

class User{
  User(String numeroTelephone,String currentAdresse,List<Commande> mesCommandes ){
    this.numeroTelephone=numeroTelephone;
    this.currentAdresse=currentAdresse;
    this.mesCommandes=mesCommandes;
  }
  late String numeroTelephone;
  late String currentAdresse;
  late List<Commande> mesCommandes;
}