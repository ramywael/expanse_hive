
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.label, required this.keyboardType, required this.controller, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 18),
      child:  TextField(
        controller: controller,
        maxLength: 50,
        decoration:InputDecoration(
          labelText: label,
          prefixText: keyboardType == TextInputType.number ? "\$" : null,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
