import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livraison_app/classes/commande.dart';
import '../classes/plat.dart';

class MesCommandes extends StatelessWidget {
  MesCommandes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Plat> p = [
      new Plat(
          'Pizza Poulet', 'Fromage, Poulet , Sauce rouge', 'Pizza', 400, 1),
      new Plat('Cocacola', '1Lettre', 'Boisson', 100, 2),
    ];
    Commande c1 = new Commande('Magic pizza', '16 juin', 'En cours', p);
    Commande c2 = new Commande('Magic pizza', '13 juin', 'Prête', p);
    Commande c3 = new Commande('Magic pizza', '3 mars', 'En cours', p);
    Commande c4 = new Commande('Magic pizza', '9 février', 'Prête', p);
    List commandes = [c1, c2, c3, c4];

    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 34,
          ),
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 24,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      print(commandes);
                    },
                    child: AutoSizeText(
                      'Mes commandes',
                      maxLines: 1,
                      style: TextStyle(fontSize: 28, fontFamily: 'Golos'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 8,
          ),
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 24,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    'Veuillez vérifier vos commandes, une fois que\n'
                    'vous aurez confirmé votre achat, vous n’aurez pas\n'
                    'le droit d’annuler.',
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff807F7F),
                      fontFamily: 'Golos',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 20,
          ),
          Expanded(
            flex: 687,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: commandes.length,
                itemBuilder: (context, index) {
                  final date = commandes[index].date;
                  final etat = commandes[index].etat;
                  final reataurant = commandes[index].restaurant;
                  final plats = commandes[index].plats;
                  return Column(
                    children: [
                      Row(
                        //row li dayra alignment llcontainer element
                        children: [
                          Spacer(
                            flex: 14,
                          ),
                          Expanded(
                            flex: 401,
                            child: Container(
                              height: 311,
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 12,
                                      ),
                                      Expanded(
                                        flex: 191,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            '${reataurant}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Golos',
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 86,
                                          child: Container(
                                            height: 26,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: etat=='Prête'? Color(0xffE8F7E5):Color(0xffFCF5E4),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: AutoSizeText(
                                                    '${etat}',
                                                    style: TextStyle(
                                                      color: etat=='Prête'? Color(0xff669965):Color(0xffCFAA72),
                                                      fontFamily: 'Golos',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Spacer(flex: 12,),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: plats.length,
                                        itemBuilder: (context, index) {
                                          final nom = plats[index].nom;
                                          final description =
                                              plats[index].description;
                                          final prix = plats[index].prix;
                                          final qte = plats[index].quantite;
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Spacer(
                                                    flex: 12,
                                                  ),
                                                  Expanded(
                                                    flex: 389,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: AutoSizeText.rich(
                                                          maxLines: 2,
                                                          TextSpan(children: [
                                                            TextSpan(
                                                              text:
                                                                  '${nom} ${prix} DA\n',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Golos'),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '${description}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Golos',
                                                                  color: Color(
                                                                      0xff9D9D9D)),
                                                            )
                                                          ])),
                                                    ),
                                                  ),
                                                  Spacer(flex: 241),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                            ],
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
