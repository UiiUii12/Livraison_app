import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:livraison_app/Controller/SearchController.dart';

import '../Controller/LoginScreenController.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController(), permanent: true);
    var visible = true.obs;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 39.h,),
              Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  AutoSizeText(
                    'Salut ${LoginScreenController.user.nom} ,\nBienvenue dans notre magasin !',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Golos',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26.h,),
              Row(
                  children: [
                    SizedBox(
                      width: 13.w,
                    ),
                    Container(
                      height: 56.h,
                      width: 401.w,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        cursorColor: Colors.grey,
                        enabled: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(EvaIcons.search, color: Color(0xff9D9D9D)),
                          hintText: 'Trouvez votre restaurant, votre produit',
                          hintStyle: TextStyle(
                            fontFamily: 'Golos',
                            fontSize: 18,
                            color: Color(0xff9D9D9D),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.r),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor:  Color(0xffF6F6F6),
                        ),
                        onTap: () {
                          controller.scroll(visible);
                        },
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 24.h,),
              Row(
                children: [
                  SizedBox(width: 13.w,),
                  AutoSizeText(
                    'Restaurants',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Golos',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17.h,),
              Container(
                height: 290.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.restaurants.length,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 13.w,),
                        Container(
                            height: 310.h,
                            width: 389.w,
                            child: controller
                                .restaurants[index]),
                      ],
                    )),
              ),
              SizedBox(height: 28.h,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.food.length,
                itemBuilder: (context, index2) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 13.w,),
                          AutoSizeText(
                            controller.food[index2].keys.single,
                            style:TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Golos',
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),

                      ],),
                      SizedBox(
                        height: 20.w,
                      ),
                      Container(
                        height: 206.h,
                        child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.food[index2]
                                  .values.single.length,
                              itemBuilder: (context, index3) {
                                return Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 13.w,),
                                    Container(
                                      height: 206.h,
                                      width: 281.w,
                                      child: controller.food[index2].values.single[index3],
                                    ),
                                  ],
                                );
                              }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
