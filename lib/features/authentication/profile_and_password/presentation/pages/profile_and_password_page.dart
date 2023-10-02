import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/authentication/profile_and_password/presentation/riverpod/profile_and_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:input_form_field/input_form_field.dart';
part '../widgets/profile_and_password_bottom_navigation.dart';
part '../widgets/profile_name.dart';

class ProfileAndPassword extends ConsumerStatefulWidget {
  const ProfileAndPassword({super.key});

  @override
  ConsumerState<ProfileAndPassword> createState() => _ProfileAndPasswordState();
}

class _ProfileAndPasswordState extends ConsumerState<ProfileAndPassword> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(profileAndPasswordProvider);
    final notifier = ref.read(profileAndPasswordProvider.notifier);

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
        ),
        bottomNavigationBar:  _ProfileAndPasswordBottomNavigation(),
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
                      height: 0.04.sw,
                    ),
                     const Text(
                      Strings.profileAndPassword,
                      style: AppTextStyle.headLineOne,
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      child: Text(
                        Strings.profileAndPasswordDescription,
                        style: AppTextStyle.textStyleOne(
                          const Color(0xff838589),
                          13.sp,
                          FontWeight.w400,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 40.h,
                    ),
                    const _ProfileName(),
                     SizedBox(
                      height: 25.h,
                    ),
                    const Text(
                      Strings.password,
                      style: AppTextStyle.smallTextTwo,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    InputFormField(
                      password: EnabledPassword(),
                      obscuringCharacter: '*',
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: notifier.passwordTextField,
                      validator: Validators.isValidPassword,
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        12.sp,
                        FontWeight.w400,
                      ),
                      hintText: Strings.passwordHintText,
                      borderType: BorderType.none,
                      errorTextStyle:
                           TextStyle(fontSize: 12.sp, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 10,
                      ),
                    ),
                     SizedBox(
                      height: 26.h,
                    ),
                    const Text(
                      Strings.referalText,
                      style: AppTextStyle.smallTextTwo,
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: notifier.referalCodeTextField,
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        12.sp,
                        FontWeight.w400,
                      ),
                      hintText:Strings.referalHintText ,
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 10,
                      ),
                    ),
                     SizedBox(
                      height: 20.h,
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
