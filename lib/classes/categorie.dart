import 'package:livraison_app/classes/plat.dart';

class Category {
  final String nom_cat ;
  final List<Plat> plat ;
  final String icon;
  Category(this.plat, this.nom_cat,this.icon);
}