import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing_demo/core/constant/string_constant.dart';
import 'package:unit_testing_demo/core/constant/typography_constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.homeAppText),
      ),
      body: Center(
        child: Text(AppString.welcomeText,
        style: AppTextStyle.text4,),
      ),
    );
  }
}
