import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/authentication/sign_in/presentation/riverpod/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';

import '../../../../../core/router/routers.dart';

part '../widgets/footer.dart';
part '../widgets/forgot_password.dart';
part '../widgets/sign_up.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInProvider);
    final notifier = ref.read(signInProvider.notifier);

    return GestureDetector(
      onTap: () {
        notifier.validate();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: const _Footer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: SingleChildScrollView(
              child: Form(
                key: notifier.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.04.sh),
                    const Text(
                      'Welcome back to',
                      style: AppTextStyle.headLineOne,
                    ),
                    const Text(
                      'Mega Mall',
                      style: AppTextStyle.headLineOne,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Please enter data to log in',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        15,
                        FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    const Text(
                      'Email',
                      style: AppTextStyle.smallTextTwo,
                    ),
                    SizedBox(height: 20.h),
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
                      hintText: 'Enter your Email Address',
                      borderType: BorderType.none,
                    ),
                    SizedBox(height: 30.h),
                    const Text(
                      'Password',
                      style: AppTextStyle.smallTextTwo,
                    ),
                    SizedBox(height: 20.h),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      password: EnabledPassword(),
                      obscuringCharacter: '*',
                      textEditingController: notifier.passwordField,
                      validator: Validators.isValidPassword,
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        14,
                        FontWeight.w400,
                      ),
                      hintText: 'Enter Account Password',
                      borderType: BorderType.none,
                    ),
                    SizedBox(height: 70.h),
                    Button(
                      label: 'Sign In',
                      onPressed: () {
                        context.go('/home');
                      },
                      disable: state.isDisabled,
                    ),
                    SizedBox(height: 70.h),
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
