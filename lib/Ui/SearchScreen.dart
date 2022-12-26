
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livraison_app/Ui/Restaurant.dart';
import 'package:livraison_app/Ui/foodSearch.dart';
import 'package:livraison_app/bdd/restauinfo.dart';
import '../Ui/Food.dart';
import '../bdd/classes.dart';
import '../controller/AppController.dart';
import '../Controller/TabBarController.dart';
import '../Themes/Theme.dart';


class SearchScreen extends StatelessWidget {
  static List<Restaurant> lo=[];
  static List<cat> li=[];
  SearchScreen({Key? key}) : super(key: key);
String text="";

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController()  , permanent:  true );
    TabBarController tab = Get.put(TabBarController() , permanent: true ) ;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Row(
          children: [
            Spacer(flex :1) ,
            Expanded(
              flex : 27 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox( height : 39.h) ,


                  AutoSizeText( """Salut,
Bienvenue dans notre magasin ! """,
                    style: TextStyle(fontFamily: 'Golos' , fontSize: 15.sp , ),),
                  SizedBox(height: 20.h,),
                  Container(
                    height:56.h ,
                    width: 401.w ,
                    child:  TextField(
                      onChanged: (value){
                        text=value;


                      },
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

                    ),
                  ),


                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column (
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                            SizedBox(height: 20.h,) ,
                            AutoSizeText( 'Restaurant',
                                style:theme().textTheme.headline4
                              //TextStyle(fontFamily: 'Golos' , fontSize: 18.sp ,fontWeight: FontWeight.bold ),
                            ) ,
                            SizedBox(height: 10.w,) ,
                            Container(
                              height : 290.h ,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount : lo.length,
                                  itemBuilder:   (contex ,index) => Row(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 310.h ,
                                          width:398.w ,
                                          child:
                                          lo[index]
                                      ),
                                      SizedBox(width: 10.w,) ,
                                    ],
                                  ) ),
                            ),
                            SizedBox(height: 20.h,) ,
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: li.length,
                              itemBuilder: (context , index2) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    AutoSizeText(li[index2].nom,
                                      style:theme().textTheme.headline4 , textAlign: TextAlign.start,
                                    ) ,
                                    StreamBuilder<List<Food>>(
                                      stream: RestauService().food2list(li[index2].id),
                                      builder: (context, snapshot) {
                                        List<Food> food=[];
                                        if (snapshot.hasData){
                                          food=snapshot.data!;
                                        }
                                        return Container(
                                          height : 220.h ,
                                          child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount  : food.length,// ch3al fi kol categorie men plas
                                              itemBuilder: (context , index3) {
                                                return Row(

                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 220.h ,
                                                      width:281.w ,
                                                      child:
                                                          Food_Search(image: '', name: food[index3].nom, prix: food[index3].prix, description: food[index3].descreption, restaurant: food[index3].resId, id: '', )
                                                      // fkol categorie les plas
                                                    ),
                                                    SizedBox(width: 10.w,) ,
                                                  ],
                                                );
                                              }),
                                        );
                                      }
                                    )
                                  ],

                                ) ;
                              } ,

                            )
                          ]
                      ),
                    ),
                  ),









                ],
              ),
            ),
            //Spacer(flex :1) ,
          ],
        ),
      ),
    );
  }
  List<Restaurant> sugestion(List<Restaurant> list,String s){
    List<Restaurant> l=[];

    print(list.length);
    for(var i in list){
      print(s);
      print(i.nom);
      if (i.nom.contains(s)){
        print("done");
        l.add(i);
      }

    }
    return l;
  }

}


