import 'package:flutter/material.dart';
import 'package:unit_testing_demo/core/constant/typography_constant.dart';

typedef FieldValueChange = Function(String value);

class TextFieldView extends StatefulWidget {
  const TextFieldView({
    Key? key,
    required this.text,
    this.obsecure = false,
    this.isVisible = false,
    this.boxColor,
    this.turns = 0,
    this.keyboardType,
    required this.onValidate,
    required this.valueDidChange,
    this.textFieldController,

    // required this.onChanged,
  }) : super(key: key);
  final String text;
  final bool obsecure, isVisible;
  final String? boxColor;
  final TextInputType? keyboardType;


  // final SvgPicture image;
  final int turns;
  final Function(String? value) onValidate;
  final FieldValueChange valueDidChange;
  final TextEditingController? textFieldController;

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  late bool _obsecure;

  @override
  void initState() {
    _obsecure = widget.obsecure;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 320,
          padding: const EdgeInsets.symmetric() +
              const EdgeInsets.only(left: 25, top: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    key: widget.key,
                    keyboardType: widget.keyboardType,
                    cursorColor: Colors.orange,
                    controller: widget.textFieldController,
                    validator: (val) => widget.onValidate(val),
                    onChanged: widget.valueDidChange,
                    style: AppTextStyle.text3,
                    obscureText: _obsecure,
                    decoration: InputDecoration(
                      suffixIcon: widget.isVisible
                          ? _obsecure
                          ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon:
                          const Icon(Icons.visibility_off_outlined, color: Colors.grey,))
                          : IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye,
                          color: Colors.grey,))
                          : null,
                      border: InputBorder.none,
                      hintText: widget.text,
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 17,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
