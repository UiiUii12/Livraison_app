
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Ui/Food.dart';
import '../Ui/Restaurant.dart';
import '../Ui/SearchScreen.dart';
import '../auth/user.dart';
import '../bdd/restauinfo.dart';


class Wrapper2 extends StatelessWidget {
  const Wrapper2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<List<Restaurant>>(
        stream:  RestauService().restaurantList,
        builder: (context, snapshot) {
      List<Restaurant> list = [];
      String text='';

      if (snapshot.hasData) {
        list = snapshot.data!;

      }
      SearchScreen.lo=list;
      return StreamBuilder<List<Food>>(
        stream: RestauService().foodlist(),
        builder: (context, snapshot) {
          List<Food> list2 = [];

          print(snapshot.hasData);
          if (snapshot.hasData) {
            list2 = snapshot.data!;

          }
          SearchScreen.li=list2;
          return SearchScreen(list1: list,list2: list2);
        }
      );
        });
  }
}
