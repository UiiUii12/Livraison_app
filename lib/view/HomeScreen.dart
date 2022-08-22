import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livraison_app/classes/commande.dart';
import '../classes/plat.dart';
import '../classes/user.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Color>ColorsPromo=[
      Color(0xffE6424B),
      Color(0xff3F3D56),
      Color(0xfff9a825),
      Color(0xffff6584),
      Color(0xff8b4e56),
      Color(0xff6b667c),
      Color(0xffe1e0e1)
    ];
    Random random = new Random();
    List<Plat> p = [new Plat('Pizza Poulet', 'Fromage, Poulet , Sauce rouge', 'Pizza', 400, 1),
                    new Plat('Cocacola', '1Lettre', 'Boisson', 100, 2),
    ];
    Commande c1 = new Commande('Magic pizza', '16 juin', 'En cours', p);
    Commande c2 = new Commande('Magic pizza', '13 juin', 'Prête', p);
    Commande c3 = new Commande('Magic pizza', '3 mars', 'En cours', p);
    Commande c4 = new Commande('Magic pizza', '9 février', 'Prête', p);
    List<Commande>ListCommandes=[c1,c2,c3,c4];
    User user1=User('0556223918','6958+WP4, Sidi Bel Abbès 22000',ListCommandes);
    List<String>Categ=[
      'assets/sandwich.svg',
      'assets/drink.svg',
      'assets/sandwich.svg',
      'assets/soup.svg',
      'assets/pizza.svg',
    ];
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 39,),
          Expanded(
            flex: 50,
            child: Row(
              children: [
                Spacer(flex:13 ,),
                Expanded(
                    flex: 294,
                    child: AutoSizeText(
                      'Salut ,\nBienvenue dans notre magasin !',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Golos',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),
                Spacer(flex: 121,),
              ],
            ),
          ),
          Spacer(flex: 26,),
          Expanded(
            flex: 50,
            child: Row(
              children: [
                Spacer(flex: 13,),
                Expanded(
                  flex: 401,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(9)),
                    child: Row(
                      children: [
                        SizedBox(width: 11,),
                        Image.asset('assets/camion.png'),
                        SizedBox(width: 7,),
                        AutoSizeText(
                            'Votre adresse\n${user1.currentAdresse}',
                             style:TextStyle(
                               fontFamily: 'Golos',
                               fontSize: 15,
                             ) ,
                        ),
                        SizedBox(width: 20,),
                        TextButton(
                            onPressed:(){},
                            child: AutoSizeText(
                              'Modifier',
                              style: TextStyle(
                                color: Color(0xffE6424B),
                                fontSize: 15,
                                fontFamily: 'Golos',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 14,),
              ],
            ),
          ),
          Spacer(flex: 26,),
          Expanded(
            flex: 50,
            child: Row(
              children: [
                Spacer(flex:13 ,),
                Expanded(
                    flex: 148,
                    child: AutoSizeText(
                      'Nouvelles offres',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Golos',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                Spacer(flex: 267,),
              ],
            ),
          ),
          Spacer(flex: 12,),
          Expanded(
            flex: 153,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
                return Row(
                  children: [
                    SizedBox(width: 13,),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                       color:ColorsPromo[random.nextInt(7)]
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
          Spacer(flex: 18,),
          Expanded(
            flex: 50,
            child: Row(
              children: [
                Spacer(flex:13 ,),
                Expanded(
                    flex: 205,
                    child: AutoSizeText(
                      'Explorer les catégories',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Golos',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                Spacer(flex: 210,),
              ],
            ),
          ),
          Spacer(flex: 16,),
          Expanded(
            flex: 153,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: Categ.length,
                itemBuilder:(context, index) {
                  final image=Categ[index];
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(flex: 13,),
                        Expanded(
                          flex:71,
                          child: Container(
                            height: 68,
                          //  width: 71,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('$image'),
                            ),
                          ),
                        ),
                      ],
                    );
                }
            ),
          ),

        ],
      ),
    );
  }
}
