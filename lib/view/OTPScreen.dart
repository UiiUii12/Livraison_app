import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key}) : super(key: key);
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}
class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState(){
    super.initState();
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
                Expanded(
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
                           text: 'Vous recevrez un code de 6 chiffres sur votre\nnuméro de téléphone +213*******10, ',
                            style: TextStyle(
                              color: Color(0xff807F7F),
                              fontSize: 17,
                              fontFamily: 'Golos',
                            )
                          ),
                          TextSpan(
                              text: 'Changer le numéro de téléphone ?',
                              recognizer: TapGestureRecognizer()..onTap = ()=>
                                Navigator.pushReplacementNamed(context, '/home'),
                              style: TextStyle(
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
                Expanded(
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
                    last: false,
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex:57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:  _textFieldOTP(
                    first: false,
                    last: false,
                  ),
                ),
                Expanded(flex: 11, child: Container()),
                Expanded(
                  flex: 57,
                  child:   _textFieldOTP(
                      first: false,
                      last: true,
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/welcome');
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
                AutoSizeText(
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
  Widget _textFieldOTP({required bool first,required bool last}) {
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
          if((value.length==1)&&(last==false)){ FocusScope.of(context).nextFocus();}
          else if ((value.length==0)&&(first==false)){FocusScope.of(context).previousFocus();}
          else if((value.length==1)&&(last==true)){FocusScope.of(context).unfocus();}
        },
      ),
    );
  }
}


