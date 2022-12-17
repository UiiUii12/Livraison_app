
import 'package:flutter/cupertino.dart';
import 'package:livraison_app/Ui/SearchScreen.dart';
import 'package:livraison_app/view/AdresseScreen.dart';
import 'package:provider/provider.dart';
import '../Ui/OnBoardingScreen.dart';
import '../auth/auth.dart';
import '../auth/user.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
   // AuthService().singeOut();
    if (user == null) {
      return const OnBoardingScreen();
    } else {
      return AdresseScreen();
    }
  }
}

