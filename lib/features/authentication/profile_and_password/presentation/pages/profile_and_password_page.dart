import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class ProfileAndPassword extends StatefulWidget {
  const ProfileAndPassword({super.key});

  @override
  State<ProfileAndPassword> createState() => _ProfileAndPasswordState();
}

class _ProfileAndPasswordState extends State<ProfileAndPassword> {

  final TextEditingController _textEditingControllerOne = TextEditingController();
  final TextEditingController _textEditingControllerTwo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible=false;
  bool _isValid = false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  void _saveForm(context,String gmail) {
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if(_isValid == true){
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
           // color: Colors.blue,
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                onTap: (){
                  _saveForm(context,_textEditingControllerOne.text);
                  HapticFeedback.mediumImpact();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width * .8,
                  decoration: BoxDecoration(
                    color:  const Color(0xff3669C9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Confirmation',style:AppTextStyle.textStyleOne(Colors.white, 14.0, FontWeight.w500),),
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
                        'Profile & Password',
                        style: AppTextStyle.headLineOne,
                      ), const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Complete the following final data to enter the Mega Mall application',
                          style: AppTextStyle.textStyleOne(
                              const Color(0xff838589), 15.0, FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Full Name',
                        style: AppTextStyle.smallTextTwo,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 12,left: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfffafafa),
                        ),
                        child: Text('Sourav Barman',style: AppTextStyle.textStyleOne(
                             Colors.black, 14.0, FontWeight.w400),),
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
                        obscureText:passwordVisible,
                        obscuringCharacter: '*',
                        textEditingController: _textEditingControllerTwo,
                        validator: (value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else{
                            if (!regex.hasMatch(value)) {
                              return 'Enter strong password with a minimum of 8 characters';
                            } else {
                              return null;
                            }
                          }
                        },
                        hintTextStyle: AppTextStyle.textStyleOne(
                            const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                        hintText: "Enter Account Password",
                        borderType: BorderType.none,
                        errorTextStyle : const TextStyle(fontSize: 13,color: Colors.red),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13,horizontal: 10),
                        suffix: GestureDetector(onTap:(){
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                          HapticFeedback.mediumImpact();
                        },child: passwordVisible == false ? const Icon( Icons.remove_red_eye_outlined,color:Color(0xff838589)) : const Icon(Icons.remove_red_eye,color: Colors.black,)),

                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const Text(
                        'Referal Code (Optional)',
                        style: AppTextStyle.smallTextTwo,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        textEditingController: _textEditingControllerOne,
                        hintTextStyle: AppTextStyle.textStyleOne(
                            const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                        hintText: "Input your code",
                        borderType: BorderType.none,
                        errorTextStyle : const TextStyle(fontSize: 13,color: Colors.red),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13,horizontal: 10),

                      ),
                      const SizedBox(
                        height: 20,
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
