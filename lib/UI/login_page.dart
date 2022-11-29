import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing_demo/UI/home.dart';
import 'package:unit_testing_demo/core/constant/string_constant.dart';
import 'package:unit_testing_demo/core/constant/typography_constant.dart';
import 'package:unit_testing_demo/core/utils/common_utils.dart';
import 'package:unit_testing_demo/core/widgets/textview_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

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
          title: Text(widget.title),
        ),
        body:  SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height *0.2,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: NetworkImage('https://pbs.twimg.com/profile_images/1219602291180756993/GFSwkWb2_400x400.png')
                  //     )
                  //   ),
                  // ),
                  const SizedBox(height: 20,),
                  Text(AppString.loginPageText,
                      style: AppTextStyle.text1),
                  const SizedBox(height: 40,),
                  FittedBox(
                    child: Container(
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
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                        validator: CommonUtils.isValidateEmail,
                        onChanged:(String value) {
                        if(validate){
                        _formKey.currentState!.validate();
                       }
                        },
                      ),
                      // TextFieldView(
                      //   key: Key("addUserId"),
                      //   textFieldController: emailTextController,
                      //   valueDidChange: (String value) {
                      //        if(validate){
                      //         _formKey.currentState!.validate();
                      //        }
                      //   },
                      //   onValidate: CommonUtils.isValidateEmail,
                      //   text: 'Email ',
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FittedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100
                      ),
                      child:TextFormField(
                        key: const Key("addPassword"),
                        obscureText: true,
                        controller: passwordTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: CommonUtils.isPasswordValid,
                        onChanged: (value) {
                        if(validate){
                           _formKey.currentState!.validate();
                         }
                         },
                      ),
                      // TextFieldView(
                      //   key:  const Key("addPassword"),
                      //   textFieldController: passwordTextController,
                      //   valueDidChange: (value) {
                      //     if(validate){
                      //       _formKey.currentState!.validate();
                      //     }
                      //   },
                      //   onValidate: CommonUtils.isPasswordValid,
                      //   text: 'Password',
                      //   isVisible: true,
                      //   obsecure: true,
                      // ),
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
