import 'package:chat_app/core/models/intro_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/intro_view.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({Key? key}) : super(key: key);

  PageController pageController = PageController(initialPage: 0);

  List<IntroModel> introPageList = ([
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
  int currentShowIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                currentShowIndex = index;
              },
              scrollDirection: Axis.horizontal,
              children: [
                IntroView(introModel: introPageList[0]),
                IntroView(introModel: introPageList[1]),
                IntroView(introModel: introPageList[2]),
                IntroView(introModel: introPageList[3]),
                IntroView(introModel: introPageList[4]),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: introPageList.length,
            effect: SlideEffect(
              dotColor: Colors.grey,
              activeDotColor: Theme.of(context).primaryColor,
            ),
            onDotClicked: (index) {
              currentShowIndex = index;
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).disabledColor,
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ]),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(24.r),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
