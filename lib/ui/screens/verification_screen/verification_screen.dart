import 'package:chat_app/core/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerificationScreen extends GetView<LoginController> {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: SpinKitRotatingPlain(
          color: Theme.of(context).primaryColor,
        ),
        child: Scaffold(
          body: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Container(
                    height: AppBar().preferredSize.height,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .dialogBackgroundColor
                              .withOpacity(0.1),
                          blurRadius: 10.r,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.w,
                          ),
                          child: SizedBox(
                            width: AppBar().preferredSize.height - 8,
                            height: AppBar().preferredSize.height - 8,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                borderRadius: BorderRadius.circular(32.r),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Text(
                          'OTP Verification',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Image.asset('assets/images/verification.jpg'),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 40.h,
                        ),
                        child: PinInputTextField(
                          pinLength: 6,
                          controller: controller.otpController,
                          textInputAction: TextInputAction.done,
                          decoration: CirclePinDecoration(
                              strokeColorBuilder: FixedColorBuilder(
                                Theme.of(context).primaryColor,
                              ),
                              hintText: '345678',
                              errorText: controller.pinError.value.isEmpty
                                  ? null
                                  : controller.pinError.value,
                              strokeWidth: 2,
                              hintTextStyle: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 20.sp,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 40.h,
                          bottom: 30.h,
                        ),
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(4, 4),
                                blurRadius: 10,
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.1),
                              ),
                            ],
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                controller.verifyOTP();
                              },
                              borderRadius: BorderRadius.circular(30.r),
                              child: Center(
                                child: Text(
                                  'Verify OTP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
