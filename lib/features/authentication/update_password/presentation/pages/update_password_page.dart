import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {

  final TextEditingController _textEditingControllerOne = TextEditingController();
  final TextEditingController _textEditingControllerTwo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible=false;
  bool confirmPasswordVisible=false;
  bool _isValid = false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
    confirmPasswordVisible=true;

  }

  void _saveForm(context,String gmail,String password) {
    setState(() {
      _isValid = _formKey.currentState!.validate();
      if(_isValid == true){
        _showMyDialog(context,gmail,password);
      }
    });
  }

  Future<void> _showMyDialog(context,String gmail,String password) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Info'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Gmail : ${gmail.toString()}'),
                Text('Pass : ${password.toString()}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                setState(() {
                  _textEditingControllerOne.text = "";
                  _textEditingControllerTwo.text = "";
                });
                Navigator.of(context).pop();
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
          height: 120,
          width: width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_textEditingControllerOne.text.isNotEmpty && _textEditingControllerTwo.text.isNotEmpty) == false ? Container(
                alignment: Alignment.center,
                height: 50,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color:  const Color(0xffc4c5c4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Save Update',style:AppTextStyle.textStyleOne(Colors.white, 14.0, FontWeight.w500),),
              ) : InkWell(
                onTap: (){
                  _saveForm(context,_textEditingControllerOne.text,_textEditingControllerTwo.text);
                  HapticFeedback.mediumImpact();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color:  const Color(0xff3669C9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Save Update',style:AppTextStyle.textStyleOne(Colors.white, 14.0, FontWeight.w500),),
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
                        'Update Password',
                        style: AppTextStyle.headLineOne,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Complete the following final data to enter the Mega Mall application',
                        style: AppTextStyle.textStyleOne(
                            const Color(0xff838589), 15.0, FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'New Password',
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
                        textEditingController: _textEditingControllerOne,
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
                        hintText: "Enter New Password",
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
                        'Confirm New Password',
                        style: AppTextStyle.smallTextTwo,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        obscureText:confirmPasswordVisible,
                        obscuringCharacter: '*',
                        textEditingController: _textEditingControllerTwo,
                        validator: (value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                           else if (!regex.hasMatch(value)) {
                              return 'Enter strong password with a minimum of 8 characters';
                            } else if(_textEditingControllerOne.text != _textEditingControllerTwo.text){
                               return "Two password fields must be equal";
                          }
                           else {
                              return null;
                            }

                        },
                        hintTextStyle: AppTextStyle.textStyleOne(
                            const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                        hintText: "Confirm New Password",
                        borderType: BorderType.none,
                        errorTextStyle : const TextStyle(fontSize: 13,color: Colors.red),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13,horizontal: 10),
                        suffix: GestureDetector(onTap:(){
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                          HapticFeedback.mediumImpact();
                        },child: confirmPasswordVisible == false ? const Icon( Icons.remove_red_eye_outlined,color:Color(0xff838589)) : const Icon(Icons.remove_red_eye,color: Colors.black,)),

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
