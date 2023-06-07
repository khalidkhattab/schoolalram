
import 'package:flutter/material.dart';

late final  String department;


class TextFormAlarm extends StatelessWidget {
  const TextFormAlarm({
    Key? key,
    required this.controller,
    required this.label,
    required this.password,
    required this.alert,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool password;
  final String alert;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return alert;
                }
                return null;
              },
              obscureText: password,
              controller: controller,
              decoration: InputDecoration(
                label: Text(label),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}