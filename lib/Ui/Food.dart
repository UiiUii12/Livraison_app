import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:livraison_app/Controller/TabBarController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class Food extends StatelessWidget {
  final String id, resId,descreption,nom,categore;
  final double prix;

   Food( {Key? key,  required this.id,required this.nom,required this.resId,required this.descreption,required this.prix,required this.categore  }) : super(key: key);
  final ajouter = false.obs ;
  final counter = 1.obs ;

  @override
  Widget build(BuildContext context) {
  TabBarController controller = Get.put(TabBarController() , permanent: true) ;
    return
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 161.h ,
                width:281.w ,
                decoration : BoxDecoration(
                  image : DecorationImage(image: AssetImage('lib/Asset/Images/Pizza.png') , fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.circular(9.r) ,

                )
            ) ,
            SizedBox(height: 10.h,) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(nom ,
                          style:  TextStyle(
                            color:
                            Colors.black ,
                            fontSize: 13.sp ,
                            fontWeight: FontWeight.bold ,
                            fontFamily: 'Golos' ,
                            ), textAlign: TextAlign.start,) ,
                        AutoSizeText('$prix'+ ' DA' ,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black ,
                            fontSize: 13.sp ,
                            fontWeight: FontWeight.bold ,
                            fontFamily: 'Golos' ,
                          ),) ,
                      ],
                    ),
                  ) ,
                  GetX<TabBarController>(
                    builder: ( controller){
                      return ElevatedButton(onPressed:(){



                        ajouter.value = ! ajouter.value   ;
                      //  controller.Continuer(ajouter.value, Food( nom:nom, prix: prix, id: id,resId: resId, categore: categore,descreption: descreption, ) , List_of_food.value) ;

                        },
                        child: AutoSizeText(ajouter.value ? 'Annuler' : 'Ajouter' ,
                          style: TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,),) ,
                        style: ElevatedButton.styleFrom(
                            primary: ajouter.value? Color(0xffFAB4B8) : Color(0xffE8F7E5),
                            onPrimary:ajouter.value ? Color(0xffE6424B) : Color(0xff669965) ,
                            minimumSize: Size(100.w, 32.h) ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r))
                        ),





                      );
                    },

                  )
            ],) ,

          ],

      );
  }
}
