import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/media_query_size.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/authentication/sign_up/presentation/riverpod/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';

part '../widgets/sign_up_footer.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;

    final state = ref.watch(signUpProvider);
    final notifier = ref.read(signUpProvider.notifier);

    return GestureDetector(
      onTap: () {
        notifier.validate();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
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
        bottomNavigationBar: _SignUpFooter(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Form(
                key: notifier.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      'Register Account',
                      style: AppTextStyle.headLineOne,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Enter email to register',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        15,
                        FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Email',
                      style: AppTextStyle.smallTextTwo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: notifier.emailField,
                      validator: Validators.isValidEmail,
                      onChanged: (val) {
                        setState(() {});
                      },
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        14,
                        FontWeight.w400,
                      ),
                      hintText: 'Enter your Email Address',
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Button(
                      label: state.isDisabled == true ? 'Sign Up': 'Continue',
                      onPressed: () {
                        context.push(
                          '/reg-verification/${notifier.emailField.text}',);
                      },
                      disable: state.isDisabled,
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
