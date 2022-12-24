import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Ui/Restaurant.dart';
import '../bdd/restauinfo.dart';
import '../classes/promotion.dart';
import '../classes/restaurant.dart';
import '../controller/AppController.dart';

class Home extends StatelessWidget {
  static String adress ='';
  Home({Key? key}) : super(key: key);
  static  List<Restaurant2> lo=[];
  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController(), permanent: true);
    controller.restaurant2=Home.lo;
    /////////////////////////////////////////////////////////////////////////////////////////////




    return StreamBuilder<List<Promotion>>(
      stream: RestauService().promoList,
      builder: (context, snapshot) {


        List<Promotion> list=[];
        if(snapshot.hasData){
          list=snapshot.data!;
        }
        return Scaffold(
          resizeToAvoidBottomInset:true,
          body: Column(children: [
            Spacer(flex: 39,),
            Row(
              children: [
                SizedBox(
                  width: 13.w,
                ),
                AutoSizeText(
                  'Salut ,\nBienvenue dans notre magasin !',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Golos',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(flex: 26,),
            Row(
              children: [
                SizedBox(
                  width: 13.w,
                ),
                Container(
                  height: 65.h,
                  width: 401.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(9.r)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(width: 11.w,),
                            Image.asset('assets/camion.png'),
                            SizedBox(width: 7.w,),
                            AutoSizeText(
                              'Votre adresse\n'+ adress,
                              style: TextStyle(
                                fontFamily: 'Golos',
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context,'/adresse');
                          },
                          child: AutoSizeText(
                            'Modifier',
                            style: TextStyle(
                              color: Color(0xffE6424B),
                              fontSize: 15.sp,
                              fontFamily: 'Golos',
                              fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Spacer(flex: 26,),
            Row(
              children: [
                SizedBox(width: 13.w,),
                AutoSizeText(
                  'Nouvelles offres',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Golos',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(flex: 12,),
            Expanded(
              flex: 190,
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context,index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 13.w,
                      ),
                      Promotion(
                        descriptionOffre: list[index].descriptionOffre,
                        nameRestaurant:list[index].nameRestaurant,
                        offre: list[index].offre,
                        image: list[index].image,)
                    ],
                  );
                },
              ),
            ),
            Spacer(flex: 18,),
            Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  AutoSizeText(
                    'Explorer les catégories',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Golos',
                      fontWeight: FontWeight.w500,
                    ),
                  ),]),
            Spacer(flex: 16,),
            Expanded(
              flex: 110,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.Categ.length,
                  itemBuilder: (context, index) {
                    final imagee = controller.Categ[index].icon;
                    final name=controller.Categ[index].nom_cat;
                    return Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Column(
                            children: [
                              Container(
                                // height: 68.h,
                                // width: 71.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(200.0)),
                                  border: Border.all(
                                    color: Color(0xffB8B4B4),
                                    width: 1.0.w,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset('$imagee',
                                      height: 30.h,
                                      width:30.w,
                                      fit: BoxFit.scaleDown
                                  ),
                                ),
                              ),
                              AutoSizeText(
                                '$name',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Golos',
                                  fontWeight: FontWeight.w500,
                                ),)
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Spacer(flex: 17,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 13.w,),
                      AutoSizeText(
                        'Restaurants',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Golos',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: AutoSizeText(
                      'Afficher tout',
                      style: TextStyle(
                        color: Color(0xffE6424B),
                        fontSize: 15.sp,
                        fontFamily: 'Golos',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                SizedBox(width: 13.w,),
              ],
            ),
            // Spacer(flex: 17,),
            Expanded(
              flex: 280,
              child: GestureDetector(
                onTap: (){},//tedi le page restaurant
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.restaurant2.length,
                    itemBuilder: (context, index) {


                      return Row(

                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Container(
                        child: controller.restaurant2[index],
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Spacer(flex: 26,)
          ],
          ),
        );
      }
    );
  }
}
