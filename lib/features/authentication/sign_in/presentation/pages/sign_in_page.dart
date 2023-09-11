import 'package:flutter/material.dart';
import 'package:input_form_field/input_form_field.dart';
import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

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
                Text('Gmail : ${password.toString()}'),
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
    width = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
              const Text('Forgot Password',style: AppTextStyle.smallTextOne,),
              Text('Sign Up',style: AppTextStyle.textStyleOne(Colors.blue, 14.0, FontWeight.w500),),
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
                    validator: (value) {
                      // Check if this field is empty
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      // using regular expression
                      else if(value.length > 35){
                        return 'Email must be less than 35 characters';
                      }else{
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }else{
                          return null;
                        }
                      }

                      // the email is valid
                      return null;
                    },
                        hintTextStyle: AppTextStyle.textStyleOne(
                            const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                        hintText: "Enter your Email Address",
                        borderType: BorderType.none,
                      errorTextStyle : const TextStyle(fontSize: 13,color: Colors.red),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13,horizontal: 10),

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
                        } else if(value.length > 13){
                          return 'Password must be less than 12 characters';
                        }else{
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
                      },child: passwordVisible == false ? const Icon( Icons.remove_red_eye_outlined,color:Color(0xff838589)) : const Icon(Icons.remove_red_eye,color: Colors.black,)),

                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  (_textEditingControllerOne.text.isNotEmpty && _textEditingControllerTwo.text.isNotEmpty) == false ? Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:  const Color(0xffc4c5c4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Sign In',style:AppTextStyle.textStyleOne(Colors.white, 14.0, FontWeight.w500),),
                  ) : InkWell(
                    onTap: (){
                      _saveForm(context,_textEditingControllerOne.text,_textEditingControllerTwo.text);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:  const Color(0xff3669C9),
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Sign In',style:AppTextStyle.textStyleOne(Colors.white, 14.0, FontWeight.w500),),
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
