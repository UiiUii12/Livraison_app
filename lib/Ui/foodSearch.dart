import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livraison_app/bdd/restauinfo.dart';
import '../controller/TabBarController.dart';
import '../Themes/Theme.dart';
import 'Restaurant.dart';
import 'RestaurantScreen.dart';

class Food_Search extends StatelessWidget {
  final String id;
  final String image ;
  final String name ;
  final double prix ;
  final String description ;
  final String restaurant ;


  Food_Search( {Key? key,  required this.image,  required this.name, required this.prix ,  required this.description, required this.restaurant,required this.id   }) : super(key: key) ;



  @override
  Widget build(BuildContext context) {

    return
      StreamBuilder<Restaurant>(
        stream: RestauService().Restau(restaurant),
        builder: (context, snapshot) {

          if (snapshot.hasData){
          return InkWell(
            onTap: (){



              Get.to( ()=> RestaurantScreen( name: snapshot.data!.nom,  adress: snapshot.data!.adress, state: snapshot.data!.state, id: snapshot.data!.id, ImageUrl:  snapshot.data!.ImageUrl,)
              );

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 161.h ,
                    width:281.w ,
                    decoration : BoxDecoration(
                      image : DecorationImage(image: AssetImage(image) , fit: BoxFit.cover ) ,
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
                          AutoSizeText(name  ,
                            style: theme().textTheme.subtitle1 ,
                            textAlign: TextAlign.start,) ,
                          AutoSizeText('$prix'+ ' DA' ,
                              textAlign: TextAlign.start,
                              style: theme().textTheme.subtitle1
                          ) ,
                        ],
                      ),
                    ) ,

                  ],) ,

              ],

            ),
          );
          } else {
          return Container();
    }
        }
      );
  }
}