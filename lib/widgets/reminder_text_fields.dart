import 'package:flutter/material.dart';

class ReminderTextField extends StatefulWidget {
  final TextEditingController controller;
  final String ? hinttext;
  final String ? initialValue;

  const ReminderTextField({
    Key? key,
    required this.controller,
     this.hinttext,
    this.initialValue,
  }) : super(key: key);

  @override
  State<ReminderTextField> createState() => _ReminderTextFieldState();
}

class _ReminderTextFieldState extends State<ReminderTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        filled: true,
        border: UnderlineInputBorder(),
      ),
    );
  }
}
