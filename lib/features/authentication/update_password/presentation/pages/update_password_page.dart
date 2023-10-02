import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/authentication/update_password/presentation/riverpod/update_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:input_form_field/input_form_field.dart';

part '../widgets/bottom_navigation.dart';

class UpdatePasswordPage extends ConsumerStatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  ConsumerState<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends ConsumerState<UpdatePasswordPage> {

  @override
  Widget build(BuildContext context) {

    final notifier = ref.read(updatePasswordProvider.notifier);


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
        bottomNavigationBar:  _BottomNavigation(),
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
                      height: 0.04.sh,
                    ),
                    const Text(
                      Strings.updatePassword,
                      style: AppTextStyle.headLineOne,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      Strings.updatePasswordDescription,
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
                      Strings.newPassword,
                      style: AppTextStyle.smallTextTwo,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: notifier.passwordFieldOne,
                      password: EnabledPassword(),
                      obscuringCharacter: '*',
                      validator: Validators.isValidPassword,
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        12.sp,
                        FontWeight.w400,
                      ),
                      hintText: Strings.newPasswordHints,
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 10,),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      Strings.confirmPassword,
                      style: AppTextStyle.smallTextTwo,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      password: EnabledPassword(),
                      obscuringCharacter: '*',
                      validator: Validators.isValidPassword,
                      textEditingController: notifier.passwordFieldTwo,

                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        12.sp,
                        FontWeight.w400,
                      ),
                      hintText: Strings.confirmPasswordHints,
                      borderType: BorderType.none,
                      errorTextStyle:
                           TextStyle(fontSize: 12.sp, color: Colors.red),
                      contentPadding:  EdgeInsets.symmetric(
                          vertical: 12.sp, horizontal: 10,),

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
