import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _textEditingControllerOne =
      TextEditingController();
  final TextEditingController _textEditingControllerTwo =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool _saveForm(context, String gmail, String password) {
    bool state = false;
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if (_isValid == true) {
        state = true;
      } else {
        state = false;
      }
    });
    return state;
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // color: Colors.blue,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.push('/reset');
                  HapticFeedback.mediumImpact();
                },
                child: Text(
                  'Forgot Password',
                  style: AppTextStyle.textStyleOne(
                      Colors.black, 15.0, FontWeight.w500,),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/bottom-nav');
                  HapticFeedback.mediumImpact();
                },
                child: Text(
                  'Sign Up',
                  style: AppTextStyle.textStyleOne(
                      Colors.blue, 15.0, FontWeight.w500,),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text(
                      'Welcome back to',
                      style: AppTextStyle.headLineOne,
                    ),
                    const Text(
                      'Mega Mall',
                      style: AppTextStyle.headLineOne,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please enter data to log in',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        15.0,
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
                      textEditingController: _textEditingControllerOne,
                      validator: (val) {
                        // Check if this field is empty
                        final value = val?.toLowerCase().trimRight();
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        // using regular expression
                        else {
                          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          } else {
                            return null;
                          }
                        }

                        // the email is valid
                        // return null;
                      },
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        14.0,
                        FontWeight.w400,
                      ),
                      hintText: 'Enter your Email Address',
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 10,),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Password',
                      style: AppTextStyle.smallTextTwo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      obscureText: passwordVisible,
                      obscuringCharacter: '*',
                      textEditingController: _textEditingControllerTwo,
                      validator: (value) {
                        final RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',);
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter strong password with'
                                ' a minimum of 8 characters';
                          } else {
                            return null;
                          }
                        }
                      },
                      hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4),
                        14.0,
                        FontWeight.w400,
                      ),
                      hintText: 'Enter Account Password',
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 10,),
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                          HapticFeedback.mediumImpact();
                        },
                        child: passwordVisible == false
                            ? const Icon(Icons.remove_red_eye_outlined,
                                color: Color(0xff838589),)
                            : const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    (_textEditingControllerOne.text.isNotEmpty &&
                                _textEditingControllerTwo.text.isNotEmpty) ==
                            false
                        ? Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffc4c5c4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Sign In',
                              style: AppTextStyle.textStyleOne(
                                  Colors.white, 14.0, FontWeight.w500,),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                            final bool state = _saveForm(context,
                                  _textEditingControllerOne.text,
                                  _textEditingControllerTwo.text,);

                             if(state){
                                context.push('/home');
                             }

                              HapticFeedback.mediumImpact();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff3669C9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Sign In',
                                style: AppTextStyle.textStyleOne(
                                    Colors.white, 14.0, FontWeight.w500,),
                              ),
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
