
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';


import '../Ui/Restaurant.dart';

import '../auth/user.dart';
import '../bdd/restauinfo.dart';
import '../view/HomeScreen.dart';


class Wrapper3 extends StatelessWidget {
  const Wrapper3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<List<Restaurant>>(
        stream:  RestauService().restaurantList,
        builder: (context, snapshot) {
          List<Restaurant> list = [];
          print("+++++++++++++++++++++++++++++++++");
          print(snapshot.hasData);

          if (snapshot.hasData) {
            list = snapshot.data!;

          }

          Home.lo=list;

          return  Home();


        });
  }
}
