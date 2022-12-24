
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bdd/restauinfo.dart';


class Restaurant2 extends StatelessWidget {
  final String image;
  final String name;
  final double longitude;
  final double latitude;
  final bool state;
  final String id;
  final String adress;

  const Restaurant2({Key? key,
    required this.image,
    required this.id,
    required this.adress,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> tableau = [];
    return StreamBuilder<List<String>>(
      stream:  RestauService().tabcate(id),

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          tableau = snapshot.data!;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 164,
              child: Container(
                width: 389.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.r),
                  image:DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  )
                  ),
                ),
            ),
            Spacer(flex: 8,),
            AutoSizeText(name,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'Golos'),),
            Row(
              children: [
                ...List.generate(tableau.length, (index) =>Row(
                  children: [
                    AutoSizeText( index == tableau.length-1 ?'${tableau[index]}-' :'${tableau[index]}-' , style: TextStyle(color: Color(0xff9D9D9D),
                        fontSize: 13.sp , fontFamily: 'Golos'),),
                  ],
                ))
              ],
            ),
            Spacer(flex: 5,),
            Row(
              crossAxisAlignment:CrossAxisAlignment.center ,
              children: [
                CircleAvatar( radius: 18.r,
                  child:Icon(EvaIcons.mapOutline , color:   state ?Color(0xff669965) : Colors.red, size: 26.sp,) ,
                  backgroundColor: state ? Color(0xffE8F7E5) : Color(0xfff7e5ef),) ,
                SizedBox(width: 3.w,),
                AutoSizeText(state ? 'Ouvert' : 'Fermé' , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ),),
                SizedBox(width: 20.w,),
                CircleAvatar( radius: 18.r,
                  child:Icon(EvaIcons.mapOutline , color: Color(0xffE8B364), size: 26.sp,) ,
                  backgroundColor: Color(0xffFCF5E4),) ,
                SizedBox(width: 3.w,),
                AutoSizeText(adress , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ), ),
              ],
            )
          ],
        );
      }
    );
  }
}
