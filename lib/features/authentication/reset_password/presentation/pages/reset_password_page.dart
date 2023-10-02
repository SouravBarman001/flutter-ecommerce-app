import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/authentication/reset_password/presentation/riverpod/reset_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(resetProvider);
    final notifier = ref.read(resetProvider.notifier);

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
                      height: 30.h,
                    ),
                    const Text(
                      Strings.resetPassword,
                      style: AppTextStyle.headLineOne,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      Strings.resetPasswordDescription,
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        13.sp,
                        FontWeight.w400,
                      ),
                    ),
                     SizedBox(
                      height: 40.h,
                    ),
                    const Text(
                      'Email',
                      style: AppTextStyle.smallTextTwo,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: notifier.emailField,
                      validator: Validators.isValidEmail,
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        14,
                        FontWeight.w400,
                      ),
                      hintText: Strings.resetPasswordHintText,
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 10,
                      ),
                    ),
                     SizedBox(
                      height: 50.h,
                    ),
                    Button(
                      label: 'Reset',
                      onPressed: (){

                        if (state.isDisabled == false) {
                          context.push(
                            '/${Routers.verification}/${notifier.emailField.text}',);
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
