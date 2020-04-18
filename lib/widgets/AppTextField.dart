import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget{
  final String hint;
  final TextEditingController textEditingController;
  final bool isNumberOnly;
  final FormFieldValidator<String> validator;

  const AppTextField({Key key, this.hint, this.textEditingController, this.isNumberOnly,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint
      ),
      keyboardType: isNumberOnly?TextInputType.number:TextInputType.text,
    );
  }

}