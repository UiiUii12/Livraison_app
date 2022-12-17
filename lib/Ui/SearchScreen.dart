
import 'package:auto_size_text/auto_size_text.dart';
import 'package:livraison_app/controller/AppController.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livraison_app/Ui/Restaurant.dart';
import '../bdd/restauinfo.dart';
import 'Food.dart';

class SearchScreen extends StatefulWidget {
  final  List<Restaurant> list1;
  final List<Food> list2;
  SearchScreen({Key? key, required this.list1, required this.list2}) : super(key: key);
  static List<Restaurant> lo=[];
  static  List<Food> li=[];

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

   AppController controller = Get.put(AppController()  , permanent:  true );
   AppController controller1;

   List <List> search = [ controller.restaurants , controller.Pizza];
   RestauService.List_of_food=[];

String text ='';
     controller.restaurants=SearchScreen.lo;
     controller.Pizza=SearchScreen.li;

            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                 body: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Spacer(flex: 1,) ,
                     Expanded(
                       flex: 29,
                       child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                             children : [
                                   Spacer(flex: 2, ) ,
                                   AutoSizeText( """Salut,
Bienvenue dans notre magasin ! """,
                                     style: TextStyle(fontFamily: 'Golos' , fontSize: 15.sp , ),),
                                   Spacer(flex: 6,) ,
                                   Container(
                                     height:56.h ,
                                     width: 401.w ,
                                     child:  GetBuilder<AppController>(
                                       builder: ( controller2){
                                         return TextField(
                                              cursorColor: Colors.black,
                                             decoration: InputDecoration(
                                               prefixIcon: Icon(EvaIcons.search , color:Color(0xff9D9D9D)),
                                               hintText: 'Trouvez votre restaurant, votre produit'  ,
                                               contentPadding: EdgeInsets.symmetric(vertical: 15.h ,),
                                                   border: OutlineInputBorder(
                                                       borderRadius: BorderRadius.circular(9.r)  ,
                                                       borderSide: BorderSide.none) ,
                                                 filled: true ,
                                                 fillColor: Color(0xffE4E4E4),

                                             ),
                                              onChanged: (value){
                                                text=value;


                                                controller.sug(widget.list1,text);
                                                controller.sug2(widget.list2, text);

                                            setState(() {
                                              controller.restaurants=SearchScreen.lo;
                                              controller.Pizza=SearchScreen.li;
                                            });


                                                setState(() {
                                                  controller.restaurants=SearchScreen.lo;
                                                  controller.Pizza=SearchScreen.li;
                                                });


                                              },
                                              onTap: (){

                                           controller.sug(controller.restaurants,text);
                                           controller.sug2(this.widget.list2, text);
                                           controller.restaurants=SearchScreen.lo;
                                           controller.Pizza=SearchScreen.li;
                                              },
                                           );
                                       }
                                     ),
                                   ),
                                   Spacer(flex: 4) ,
                                   Expanded(
                                     flex: 90,
                                     child: ListView(
                                       children: [
                                         ...List.generate(2, (index) => Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             AutoSizeText('Restaurant' , style:
                                             TextStyle(fontFamily: 'Golos' , fontSize: 18.sp ,fontWeight: FontWeight.bold ), ) ,
                                             SizedBox(height: 10.w,) ,
                                             Container(
                                               height: 300.h,
                                               width: double.maxFinite,
                                               child: ListView(
                                                 physics: BouncingScrollPhysics(),
                                                 scrollDirection: Axis.horizontal,
                                                 children: [

                                                   ...List.generate(search[index].length, (index2) => Row(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                       Container(
                                                           height: 300.h,
                                                           width: 281.w,
                                                           child:
                                                          search[index][index2]
                                                          ),
                                                       SizedBox(width: 10.w,) ,
                                                     ],
                                                   ) ) ,
                                                 ],
                                               ),
                                             ),
                                             SizedBox(height: 30.h,),
                                           ],
                                         )
                                         )
                                       ],
                                     ),
                                   ) ,


                             ],


                       ),
                     ),
                     Spacer(flex: 1,),
                   ],
                 ),
              ),
            );

      }
}

