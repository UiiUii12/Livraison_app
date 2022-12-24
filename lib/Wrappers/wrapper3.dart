
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';


import '../Ui/Restaurant.dart';

import '../auth/user.dart';
import '../bdd/restauinfo.dart';
import '../classes/restaurant.dart';
import '../view/HomeScreen.dart';


class Wrapper3 extends StatelessWidget {
  const Wrapper3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<List<Restaurant2>>(
        stream:  RestauService().restaurant2List,
        builder: (context, snapshot) {
          List<Restaurant2> list = [];


          if (snapshot.hasData) {
            list = snapshot.data!;

          }

          Home.lo=list;

          return  Home();


        });
  }
}
