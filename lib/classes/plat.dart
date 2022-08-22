class Plat{

  Plat(String nom,String description,String categ,double prix,int qte){
    this.nom=nom;
    this.description=description;
    categorie=categ;
    this.prix=prix;
    this.quantite=qte;
  }
  late String nom;
  late String description;
  late String categorie;
  late double prix;
  late int quantite;
}