import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String> validator;

  InputField({this.controller,this.labelText,this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:                 TextFormField(decoration: InputDecoration(
          labelText: labelText),
          controller: controller,
          validator:  validator,
      ),
    );
  }
}
