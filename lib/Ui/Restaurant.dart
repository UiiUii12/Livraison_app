import 'dart:core';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/TabBarController.dart';
import '../bdd/restauinfo.dart';

import 'RestaurantScreen.dart';

class Restaurant extends StatelessWidget {
  final String nom ,imageUrl,id,phone;
  final String adress;
  final String ImageUrl;
  final double longitude,latitude;
 final bool   state ;
 Restaurant({Key? key,required this.nom,required this.adress,required this.id,required this.phone, required this.state, required this.imageUrl, required this.ImageUrl, required this.longitude, required this.latitude}) : super(key: key);

  List<String> tableau = [];
  @override
  Widget build(BuildContext context) {

    return
        StreamBuilder<List<String>>(
            stream: RestauService().tabcate(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              tableau = snapshot.data!;
            }
            return InkWell(
              onTap: (){
                TabBarController tab = Get.put(TabBarController() , permanent: true ) ;
                tab.inisialize(tableau.length) ;

                Get.to( ()=> RestaurantScreen( name: nom, adress: adress, state: state, ImageUrl: ImageUrl, id: id,)
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 164.h ,
                    width:398.w ,
                    decoration : BoxDecoration(
                      image : DecorationImage(image: NetworkImage(imageUrl) , fit: BoxFit.cover ) ,
                      borderRadius: BorderRadius.circular(9.r) ,

                    )
                  ) ,
                  SizedBox(height: 10.h,) ,
                  AutoSizeText(nom , style: TextStyle(fontFamily: 'Golos' , fontSize: 18.sp ,fontWeight: FontWeight.bold ), textAlign: TextAlign.start,) ,
                   Row(children: [
                     ...List.generate(tableau.length, (index) => Row(
                       children: [
                           AutoSizeText( index == tableau.length-1 ?'${tableau[index]}-' :'${tableau[index]}-' , style: TextStyle(color: Color(0xff9D9D9D),
                            fontSize: 13.sp , fontFamily: 'Golos'),),
                       ],
                     )) ,
                   ],),

                  SizedBox(height: 11.h,) ,
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    children: [
                      CircleAvatar( radius: 18.r,
                         child:Icon(EvaIcons.mapOutline , color:   state ?Color(0xff669965) : Colors.red, size: 26.sp,) ,
                         backgroundColor: state ? Color(0xffE8F7E5) : Color(0xfff7e5ef),) ,

                      Spacer(flex: 2,) ,

                      AutoSizeText(state ? 'Ouvert' : 'Fermé' , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ),),

                      Spacer(flex: 10,) ,

                      CircleAvatar( radius: 18.r,
                        child:Icon(EvaIcons.mapOutline , color: Color(0xffE8B364), size: 26.sp,) ,
                        backgroundColor: Color(0xffFCF5E4),) ,
                      Spacer(flex: 2,) ,
                      Expanded(
                        flex: 86,
                          child: AutoSizeText(adress , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ), )
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        );
  }
}
