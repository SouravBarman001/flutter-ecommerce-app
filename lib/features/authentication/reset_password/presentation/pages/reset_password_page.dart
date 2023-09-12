import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _textEditingControllerOne =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool _saveForm(context, String gmail) {
    bool state = false;
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if (_isValid == true) {
        state = true;
        // _showMyDialog(context, gmail);
      }else{
        state = false;
      }
    });
    return state;
  }

  Future<void> _showMyDialog(context, String gmail) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Gmail : ${gmail.toString()}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Reset'),
              onPressed: () {

                context.pop();
                HapticFeedback.mediumImpact();
              },
            ),
          ],
        );
      },
    );
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
          leading: GestureDetector(
            onTap: (){
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
                    'Reset Password',
                    style: AppTextStyle.headLineOne,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Email account to reset your password',
                    style: AppTextStyle.textStyleOne(
                        const Color(0xff838589), 15.0, FontWeight.w400),
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
                      var value = val?.toLowerCase().trimRight();
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      else {
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return "Please enter a valid email address";
                        } else {
                          return null;
                        }
                      }

                      // the email is valid
                     // return null;
                    },
                    hintTextStyle: AppTextStyle.textStyleOne(
                        const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                    hintText: "Enter your Email Address",
                    borderType: BorderType.none,
                    errorTextStyle:
                        const TextStyle(fontSize: 13, color: Colors.red),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 10),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () {
                      bool state = _saveForm(context, _textEditingControllerOne.text);

                      if(state){
                        context.push('/verification/${_textEditingControllerOne.text}');
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
                        'Reset',
                        style: AppTextStyle.textStyleOne(
                            Colors.white, 14.0, FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
