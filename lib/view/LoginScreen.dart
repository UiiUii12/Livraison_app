import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:livraison_app/controller/AppController.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/customDialog.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    AppController controller=Get.put(permanent: true , AppController()) ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(flex: 10,),
            Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Bienvenue dans notre\nlivraison de nourriture',
                      maxLines: 2,
                      style: TextStyle(fontSize: 28, fontFamily: 'Golos'
                          ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(flex: 1,),
            Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Ajoutez votre numéro de téléphone pour faciliter\nle contact avec notre service',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff807F7F),
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 3,),
            Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Numéro de téléphone',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 1,),
            Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 24,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(9)),
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Golos',
                            fontSize: 18),
                        cursorColor: Colors.grey,
                        enabled: true,
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 11),
                              SvgPicture.asset('assets/icons8-algérie-48.svg'),
                              SizedBox(
                                width: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.5),
                                child: Text(
                                  "+213",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Golos'),
                                ),
                              )
                            ],
                          ),
                          counterText: "",
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                          isCollapsed: true,
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        maxLength: 9,
                        textAlignVertical: TextAlignVertical.center,
                        controller:controller.phoneNumber,
                        onChanged: (phoneNumber){
                          controller.onSubmitLogin();
                         if(GetUtils.isLengthEqualTo(phoneNumber, 9)){
                            FocusScope.of(context).unfocus();
                        };}
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1,),
              ],
            ),
            Spacer(flex: 4,),
            Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 24,
                  child: Container(
                    height: 50,
                    child:
                      GetBuilder(
                        builder:(AppController controller)=> ElevatedButton(
                          onPressed: GetUtils.isLengthEqualTo(controller.phoneNumber.text,9 ) ?(){
                           /* showDialog(
                              //barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context){
                                  return customDialog(
                                    title: "S'il vous plaît, attendez",
                                    ligne1:"vous recevrez un code pour vérifier" ,
                                    ligne2: "votre identité",
                                    asset:'assets/json/sending.json' ,
                                  );});*/
                           Navigator.pushNamed(context, '/otp');
                          }:null,
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: 'Golos',
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffE6424B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                 )),
                        ),
                      ),
                    ),
                  ),
                Spacer(flex: 1,),
              ],
            ),
            Spacer(flex: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Vous avez un problème  ?',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Golos',
                  ),
                ),
                TextButton(
                    onPressed: () {
                      controller.onInDirectCall();
                    },
                    child: AutoSizeText(
                      'Contactez-nous',
                      style: TextStyle(
                        color: Color(0xffE6424B),
                        fontSize: 17,
                        fontFamily: 'Golos',
                      ),
                    ))
              ],
            ),
            Spacer(flex: 50,),
          ],
        ),
      ),
    );
  }

}
