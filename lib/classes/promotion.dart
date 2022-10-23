
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livraison_app/classes/categorie.dart';
import 'package:livraison_app/controller/AppController.dart';

class Promotion extends StatefulWidget {
  final String image;
  final String nameRestaurant;
  final String offre;
  final String descriptionOffre;

  const Promotion({Key? key,
    required this.image,
    required this.nameRestaurant,
    required this.offre,
    required this.descriptionOffre,
  }) : super(key: key);

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion>with AutomaticKeepAliveClientMixin {
  @override

  Widget build(BuildContext context) {
    //AppController controller=Get.put(permanent: true , AppController()) ;
    final RxBool ajoute=false.obs;
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex:190,
          child: Container(
            width: 396.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: AppController.ColorsPromo[AppController.ind.nextInt(7)],
            ),
            child: Row(
              children: [
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex:18,),
                    AutoSizeText('${widget.nameRestaurant}',
                      style: TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white),),
                    Spacer(flex:8,),
                    AutoSizeText('${widget.offre}',style:TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.white),),
                    Spacer(flex: 8,),
                    AutoSizeText('${widget.descriptionOffre}',style: TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w400,fontSize: 15.sp,color: Colors.white),),
                    Spacer(flex: 8,),
                    Expanded(
                      flex: 32,
                      child: Container(
                        width: 100.w,
                        child: GetX(
                          builder:(AppController controller)=> ElevatedButton(
                              onPressed: (){
                                controller.onAddPromoToCart(ajoute);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                primary: ajoute==false?Color(0xffE8F7E5):Color(0xffFAB4B8),
                              ),
                              child:ajoute==false ?
                              Text(
                                'Ajouter',
                                style: TextStyle(fontSize:14.sp ,fontWeight:FontWeight.w500 ,color:Color(0xff669965) ,),)
                                     : Text('Annuler',style:TextStyle(fontSize:14.sp ,fontWeight:FontWeight.w500 ,color:Color(0xffE6424B) ,) ,),
                        ),
                      ),),
                    ),
                    Spacer(flex:10,),
                  ],
                ),
                SizedBox(width: 15.w,),
                Column(
                  children: [
                    Spacer(flex: 33,),
                    Expanded(
                     flex:112,
                     child: Container(
                         width:112.w,
                         child: Image.asset('assets/images/promo1.png')),
                   ),
                    Spacer(flex: 8,),
                  ],)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
