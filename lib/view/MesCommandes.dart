import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:livraison_app/classes/commande.dart';
import 'package:livraison_app/Controller/MesCommandesScreenController.dart';
import 'package:livraison_app/classes/plat.dart';

class MesCommandes extends StatelessWidget {
  MesCommandes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MesCommandesScreenController controller =Get.put(MesCommandesScreenController(),permanent:true);
    List<Plat> plats = [
      Plat('Pizza Poulet',400, 'Fromage, Poulet , Sauce rouge',2),
      Plat('Cocacola', 100,'1Lettre',3),];
    List<Plat> plats1 = [
      Plat('Pizza Poulet', 400,'Fromage, Poulet , Sauce rouge',5),
      Plat('Pizza Poulet',  400,'Fromage, Poulet , Sauce rouge',1),
      Plat('Cocacola', 100,'1Lettre',1),
      Plat('Cocacola',100,'1Lettre',2),
      Plat('Cocacola',  100,'1Lettre',3),
      Plat('Cocacola',100,'1Lettre',4),
      Plat('Cocacola',100,'1Lettre',1),
    ];

    Commande c1 = new Commande('Magic pizza', '16 juin 2022', 'En cours',plats);
    Commande c2 = new Commande('Magic pizza', '13 juin 2022', 'Completée', plats1);
    Commande c3 = new Commande('Magic pizza', '3 mars 2022', 'Annulée', plats);
    Commande c4 = new Commande('Magic pizza', '9 février 2022', 'Completée',plats);
    Commande c5 = new Commande('Magic pizza', '9 février 2022', 'Completée',plats1);
    Commande c6 = new Commande('Magic pizza', '9 février 2022', 'Completée', plats);
    Commande c7 = new Commande('Magic pizza', '9 février 2022', 'Annulée', plats);
    Commande c8 = new Commande('Magic pizza', '9 février 2022', 'Completée',plats);
    Commande c9 = new Commande('Magic pizza', '9 février 2022', 'Completée', plats);
    Commande c10 = new Commande('Magic pizza', '9 février 2022', 'Completée',plats);
    List commandes = [c1, c2, c3, c4,c5,c6,c7,c8,c9,c10,c10,c10,c10,];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 34.h,),
            Row(
              children: [
                Spacer(flex: 14,),
                Expanded(
                  flex: 400,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Mes commandes',
                      maxLines: 1,
                      style: TextStyle(fontSize: 28.sp, fontFamily: 'Golos'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Row(
              children: [
                Spacer(flex: 14,),
                Expanded(
                  flex: 400,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Veuillez vérifier vos commandes, une fois que\n'
                          'vous aurez confirmé votre achat, vous n’aurez pas\n'
                          'le droit d’annuler.',
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Color(0xff807F7F),
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: commandes.length,
                itemBuilder: (context, index) {
                  final date = commandes[index].date;
                  final etat = commandes[index].etat;
                  final reataurant = commandes[index].restaurant;
                  final plats = commandes[index].plats;
                  return Row(
                    children: [
                      Spacer(flex: 14,),
                      Expanded(
                        flex:400,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  Spacer(flex:12),
                                  Expanded(
                                    flex: 376,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '${reataurant}',
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Spacer(flex: 1,),
                                            Container(
                                              width: 86.w,
                                              height: 26.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(9),
                                                color:etat=='Completée'?Color(0xffE8F7E5) :etat=='En cours'?Color(0xffFCF5E4):Color(0xffFAB4B8)
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
                                                        color: etat=='Completée'? Color(0xff669965):etat=='En cours'?Color(0xffCFAA72):Color(0xffE6424B),
                                                        fontFamily: 'Golos',
                                                        fontSize: 15.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 17.h,),

                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children:[
                                            ...List.generate(
                                                plats.length,
                                                    (index)=>Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: AutoSizeText(
                                                        '${plats[index].quantite}x ${plats[index].name} ${plats[index].prix}DA',
                                                        style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Golos',
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: AutoSizeText('${plats[index].description}',
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Golos',
                                                            color: Color(0xff9D9D9D)
                                                        ),
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    SizedBox(height:13.h,),
                                                  ],))
                                          ]
                                        ),
                                        SizedBox(height: 8.h,),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            'Date',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Golos',
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            '${date}',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Golos',
                                                color: Color(0xff9D9D9D)
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(height: 8.h,),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            'Coût total',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Golos',
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(height: 11.h,),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                'Vos commandes',
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Spacer(flex: 1,),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '800DA',
                                                style: TextStyle(
                                                  color: Color(0xffE6424B),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 7.h,),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                'Livraison',
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Spacer(flex: 1,),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '500DA',
                                                style: TextStyle(
                                                  color: Color(0xffE6424B),
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 7.h,),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                'Total',
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Spacer(flex: 1,),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '1300DA',
                                                style: TextStyle(
                                                  color: Color(0xffE6424B),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos',
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 22.h,),
                                      ],
                                    ),
                                  ),
                                  Spacer(flex: 12,)
                                ],
                              ),
                            ),
                            SizedBox(height: 32.h,),
                          ],
                        ),
                      ),
                      Spacer(flex: 14,),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}