import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OrderConfirmerScreen extends StatelessWidget {
  OrderConfirmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(flex:250, child: Container(),),
            Expanded(flex:229, child: Image.asset('assets/OrderConfirmer.png')),
            Row(
              children: [
                Expanded(flex: 5, child: Container()),
                Expanded(
                  flex: 33,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'Votre commande en route',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Golos'
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded( flex: 5, child: Container(),),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Container()),
                Expanded(
                  flex: 33,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      maxLines: 1,
                      'vers vous',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Golos'
                      ),
                    ),
                  ),
                ),
                Expanded( flex: 5, child: Container(),),
              ],
            ),
            Expanded( flex: 20, child: Container(),),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'Numéro de commande :123456789 ',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff807F7F),
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            Expanded(
              flex: 30,
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
                        Navigator.pushNamed(context, '/home');
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
            Expanded(flex: 250, child: Container(),),
          ],
        ),
      ),
    );
  }
}
