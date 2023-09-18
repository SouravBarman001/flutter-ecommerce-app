import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';
import 'package:pinput/pinput.dart';

class RegistrationVerificationPage extends StatefulWidget {
  const RegistrationVerificationPage({super.key, required this.userEmail});
  final String userEmail;

  @override
  State<RegistrationVerificationPage> createState() =>
      _RegistrationVerificationPageState();
}

class _RegistrationVerificationPageState
    extends State<RegistrationVerificationPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  var pinCode = '';
  bool _isValid = false;

  bool _saveForm(context, String pin) {
    bool state = false;
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if (_isValid == true) {
        state = true;
        //   _showMyDialog(context,pin);
      }
    });
    return state;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
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
                      'Verification',
                      style: AppTextStyle.headLineOne,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We have sent a verification code to ',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff838589),
                        15.0,
                        FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.userEmail.toLowerCase()} ',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff838589),
                            15.0,
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
                              14.0,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
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
                            onTap: () {
                              HapticFeedback.mediumImpact();
                            },
                            child: Text(
                              'Re-send Code',
                              style: AppTextStyle.textStyleOne(
                                Colors.blue,
                                14.0,
                                FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      //color: Colors.blue,
                      child: Pinput(
                        controller: pinController,
                        focusNode: focusNode,
                        length: 4,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        defaultPinTheme: PinTheme(
                          width: 74,
                          height: 55,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffededed)),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFAFAFA),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else if (value.length < 4) {
                            return 'All fields must be completed';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        final bool state =
                            _saveForm(context, pinController.text);
                        if (state) {
                          context.push('/profile-and-password');
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
                            Colors.white,
                            14.0,
                            FontWeight.w600,
                          ),
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
