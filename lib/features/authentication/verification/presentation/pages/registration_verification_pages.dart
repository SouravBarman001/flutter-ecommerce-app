import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/riverpod/registration_verification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class RegistrationVerificationPage extends ConsumerStatefulWidget {
  const RegistrationVerificationPage({required this.userEmail, super.key});
  final String userEmail;

  @override
  ConsumerState<RegistrationVerificationPage> createState() =>
      _RegistrationVerificationPageState();
}

class _RegistrationVerificationPageState
    extends ConsumerState<RegistrationVerificationPage> {

  @override
  Widget build(BuildContext context) {

   final providerState = ref.watch(registrationVerificationProvider);
   final notifier = ref.read(registrationVerificationProvider.notifier);



    return GestureDetector(
      onTap: () {
        notifier.validate();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Form(
                key: notifier.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:  0.05.sw,
                    ),
                    const Text(
                      'Verification',
                      style: AppTextStyle.headLineOne,
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'We have sent a verification code to ',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        13.sp,
                        FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.userEmail.toLowerCase()} ',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff838589),
                            13.sp,
                            FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                            HapticFeedback.mediumImpact();
                          },
                          child: Text(
                            'Change?',
                            style: AppTextStyle.textStyleOne(
                              Colors.blue,
                              13.sp,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 90.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Verification Code',
                            style: AppTextStyle.smallTextTwo,
                          ),
                          GestureDetector(
                            onTap: HapticFeedback.mediumImpact,
                            child: Text(
                              'Re-send Code',
                              style: AppTextStyle.textStyleOne(
                                  Colors.blue, 13.sp, FontWeight.w500,),
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      child: Pinput(
                        controller: notifier.pinController,
                        focusNode: notifier.focusNode,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        defaultPinTheme: PinTheme(
                          width: 74,
                          height: 55,
                          textStyle:  TextStyle(
                              fontSize: 20.sp,
                              color: const Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600,),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffededed)),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFAFAFA),
                          ),
                        ),
                        validator: Validators.inValidOTP,
                      ),
                    ),
                     SizedBox(
                      height: 50.h,
                    ),
                    Button(
                      label: 'Continue',
                      onPressed: () {
                        if (providerState.isDisabled) {
                          context.push('/${Routers.profileAndPassword}');
                        }
                        HapticFeedback.mediumImpact();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
