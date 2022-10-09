import 'package:chat_app/core/models/intro_models.dart';
import 'package:flutter/cupertino.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({Key? key}) : super(key: key);

  PageController pageController = PageController(initialPage: 0);

  List<IntroModel> introPage = ([
    IntroModel(
      'Number Verification',
      '',
      'assets/images/intro1.jpg',
    ),
    IntroModel(
      'Find Friend Contact',
      '',
      'assets/images/intro2.jpg',
    ),
    IntroModel(
      'Online Messages',
      '',
      'assets/images/intro3.jpg',
    ),
    IntroModel(
      'User Profile',
      '',
      'assets/images/intro4.jpg',
    ),
    IntroModel(
      'Settings',
      '',
      'assets/images/intro5.jpg',
    ),
  ]);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
