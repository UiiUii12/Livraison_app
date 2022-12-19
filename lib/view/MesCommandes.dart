import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../auth/user.dart';
import '../bdd/classes.dart';
import '../bdd/clientinfo.dart';


class MesCommandes extends StatelessWidget {
  MesCommandes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
List<MaCommande>command=[];
    return StreamBuilder<List<MaCommande>>(
      stream: DatabaseService(uid: user!.uid).MaCommand,
      builder: (context, snapshot) {
        print("**************************************");
        print(snapshot.hasData);
        if (snapshot.hasData) {
          command = snapshot.data!;
        }


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
                    itemCount: command.length,
                    itemBuilder: (context, index) {
                      final date = command[index].date;
                      final etat = command[index].etat;
                      final reataurant = command[index].nom;
                          List<Maplat> plats = [];
                      return StreamBuilder<List<Maplat>>(
                        stream: DatabaseService(uid: user.uid).Mapla(command[index].id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            plats = snapshot.data!;
                          }
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
                                                                '${plats[index].nom} ${plats[index].prix}DA',
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
                                                              child: AutoSizeText('${plats[index].descreption}',
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
                        }
                      );
                    }),
              ],
            ),
          ),
        );
      }
    );
  }
}