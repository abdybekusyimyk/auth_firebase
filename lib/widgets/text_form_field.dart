import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.icon,
    required this.text,
    required this.controller,
  });

  final Widget icon;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          labelText: text,
        ),
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}
