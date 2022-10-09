import 'package:chat_app/core/models/intro_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroView extends StatelessWidget {
  final IntroModel introModel;
  const IntroView({required this.introModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Center(
              child: Container(
                width: 1.sw,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    introModel.assetsImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
        Expanded(
            child: Container(
          child: Text(
            introModel.titleText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}
