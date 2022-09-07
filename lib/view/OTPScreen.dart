import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:livraison_app/view/AdresseScreen.dart';
import 'package:livraison_app/view/LoginScreen.dart';


class OTPScreen extends StatefulWidget {
  final String phone;

  OTPScreen({Key? key,required this.phone}) : super(key: key);
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}
String _verificationCode="";
class _OTPScreenState extends State<OTPScreen> {
  String code="";
  String a = "", b = "", c = "", d = "", e = "", f = "";
  @override
  void initState(){
    super.initState();
    _signeInWithPhoneNumbre();
  }
  @override
  void dispose(){

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(flex: 10, child: Container(),),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
              const  Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Vérification OTP',
                      maxLines: 2,
                      style: TextStyle(fontSize: 28, fontFamily: 'Golos'
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(flex: 1, child: Container(),
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(
                           text: 'Vous recevrez un code de 6 chiffres sur votre\nnuméro de téléphone +213*******'+widget.phone[7]+widget.phone[8]+', ',
                            style: const TextStyle(
                              color: Color(0xff807F7F),
                              fontSize: 17,
                              fontFamily: 'Golos',
                            )
                          ),
                          TextSpan(
                              text: 'Changer le numéro de téléphone ?',
                              recognizer: TapGestureRecognizer()..onTap = ()=>
                                Navigator.pushReplacementNamed(context, '/home'),
                              style: const TextStyle(
                                color: Color(0xffE6424B),
                                fontSize: 17,
                                fontFamily: 'Golos',
                              )
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(flex: 5, child: Container(),),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
               const Expanded(
                  flex: 24,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Code de vérfication',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Row(
              children: [
                Expanded(flex:14, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: true,
                    last: false,nemero: 0
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                      nemero: 1
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,nemero: 2
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex:57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                      nemero: 3
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                      nemero: 4
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:   _textFieldOTP(
                      first: false,
                      last: true,
                      nemero: 5
               ),
                ),
                Expanded(flex: 14, child: Container()),
              ],
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 24,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {

                        code=a+b+c+d+e+f;
                        try{
                          UserCredential result =await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: code));
                     print('///////////////////////////////////////');
                          print("login done");
                          Get.offAll(AdresseScreen());
                        //  AuthService().singeOut(); //hadiiiiiii lazam ftest
                        }catch(e){
                          print("******************** erreur *********************");
                          print(e);

                          Get.offAll(LoginScreen());

                        }

                      },
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
                              side: BorderSide(color: Colors.red))),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const AutoSizeText(
                  'Vous avez un problème  ?',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Golos',
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context,'/home');
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
            Expanded(flex: 50, child: Container())
          ],
        ),
      ),
    );
  }
  Widget _textFieldOTP({required bool first,required bool last,required int nemero}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(

          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(9)
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        showCursor: false,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Golos',
        ),
        onChanged: (value){
          if (nemero==0){a=value;}else if (nemero==1){b=value;}else if(nemero==2){c=value;}else if(nemero==3){d=value;}else if(nemero==4){e=value;}else if(nemero==5){f=value;}
          if((value.length==1)&&(last==false)){ FocusScope.of(context).nextFocus();}
          else if ((value.length==0)&&(first==false)){FocusScope.of(context).previousFocus();}
          else if((value.length==1)&&(last==true)){FocusScope.of(context).unfocus();}
        },
      ),
    );
  }
  Future _signeInWithPhoneNumbre() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+213${widget.phone}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) async {
                  if (value.user!=null){print('loggin');};
            });

          },
          verificationFailed: (FirebaseException e) {


            print(e.message);

          },
          codeSent: (String verifictaionID, int? resendToken) {
            setState(() {
              _verificationCode = verifictaionID;
            });
          },
          codeAutoRetrievalTimeout: (String verifictaionID) {
            setState(() {
              _verificationCode = verifictaionID;
            });
          },
          timeout: Duration(seconds: 60));
    } catch (e) {}
  }
}


