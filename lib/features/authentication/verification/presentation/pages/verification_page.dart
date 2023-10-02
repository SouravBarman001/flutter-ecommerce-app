import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/media_query_size.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/riverpod/sign_in_verification_provider.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/riverpod/time_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

part '../widgets/timer_section.dart';
// part '../widgets/otp_field.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({required this.userEmail, super.key});
  final String userEmail;

  @override
  ConsumerState<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;

    final providerState = ref.watch(signInVerificationProvider);
    final notifier = ref.read(signInVerificationProvider.notifier);



    return GestureDetector(
      onTap: (){
        notifier.validate();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              context.pop();
              HapticFeedback.mediumImpact();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
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
                      height: 0.06.sw,
                    ),
                    const Text(
                      Strings.verification,
                      style: AppTextStyle.headLineOne,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                     Strings.verificationDescription,
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        15,
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
                              14,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 80.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            Strings.verificationCode,
                            style: AppTextStyle.smallTextTwo,
                          ),
                          Text(
                            Strings.resendCode,
                            style: AppTextStyle.textStyleOne(
                              Colors.blue,
                              12.sp,
                              FontWeight.w500,
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
                            fontSize: 18.sp,
                            color: const Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600,
                          ),
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
                      height: 25.h,
                    ),
                    const _TimerSection(),
                     SizedBox(
                      height: 40.h,
                    ),
                    Button(
                        label: 'Continue',
                        onPressed: (){
                          if(providerState.isDisabled){
                            context.push('/${Routers.updateNewPassword}');
                          }

                        },
                    textStyle: AppTextStyle.textStyleOne(
                      Colors.white,
                      13.sp,
                      FontWeight.w600,
                    ),
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
