import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing_demo/UI/home.dart';
import 'package:unit_testing_demo/core/constant/string_constant.dart';
import 'package:unit_testing_demo/core/constant/typography_constant.dart';
import 'package:unit_testing_demo/core/utils/common_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController rePasswordTextController = TextEditingController();

  bool validate = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('SignUp Page'),
        ),
        body:  SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Text(AppString.signupPageText,
                      style: AppTextStyle.text1),
                  const SizedBox(height: 40,),
                  ///Name
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.25,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100
                      ),
                      child: TextFormField(
                        key: const Key("addUserId"),
                        controller: nameTextController,
                        decoration: const InputDecoration(
                          labelText: 'Name ',
                          border: InputBorder.none,
                        ),
                        validator: CommonUtils.isName,
                        onChanged:(String value) {
                          if(validate){
                            _formKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ///Email
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.25,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100
                      ),
                      child: TextFormField(
                        key: const Key("addUserId"),
                        controller: emailTextController,
                        decoration: const InputDecoration(
                          labelText: 'Email ',
                          border: InputBorder.none,
                        ),
                        validator: CommonUtils.isValidateEmail,
                        onChanged:(String value) {
                          if(validate){
                            _formKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ///password
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.25,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100
                      ),
                      child: TextFormField(
                        key: const Key("addUserId"),
                        controller: passwordTextController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                        ),
                        validator: CommonUtils.isValidateEmail,
                        onChanged:(String value) {
                          if(validate){
                            _formKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ///re-password
                  FittedBox(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.25,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100
                      ),
                      child:TextFormField(
                        key: const Key("addPassword"),
                        obscureText: true,
                        controller: rePasswordTextController,
                        decoration:  const InputDecoration(
                          labelText: 'Re-Password',
                          border: InputBorder.none,
                        ),
                        validator: CommonUtils.isPasswordValid,
                        onChanged: (value) {
                          if(validate){
                            _formKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () async {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState?.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                      }
                    },
                    child: Container(
                      key: Key("signInButton"),
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue
                      ),
                      child: Center(
                        child: Text(AppString.loginText,
                          style: AppTextStyle.text2,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
