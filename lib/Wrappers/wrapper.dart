
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Ui/OnBoardingScreen.dart';
import '../auth/user.dart';
import '../view/HomeScreen.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      return OnBoardingScreen();
    } else {
      return Home();
    }
  }
}

