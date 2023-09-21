import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _textEditingControllerOne =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;

  bool _saveForm(context, String gmail) {
    bool state = false;
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if (_isValid == true) {
        state = true;
        //_showMyDialog(context,gmail);
      } else {
        state = false;
      }
    });

    return state;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // color: Colors.blue,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have an Account?',
                style: AppTextStyle.textStyleOne(
                    const Color(0xff838589), 15.0, FontWeight.w500,),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                  HapticFeedback.mediumImpact();
                },
                child: Text(
                  'Sign In',
                  style: AppTextStyle.textStyleOne(
                      const Color(0xff3669C9), 15.0, FontWeight.w600,),
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
                      onChanged: (val) {
                        setState(() {});
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
                      height: 70,
                    ),
                    _textEditingControllerOne.text.isNotEmpty == false
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
                              final bool state = _saveForm(
                                  context, _textEditingControllerOne.text,);
                              if (state) {
                                context.push(
                                    '/reg-verification/${_textEditingControllerOne.text}',);
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
                                'Continue',
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
