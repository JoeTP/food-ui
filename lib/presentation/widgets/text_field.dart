import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.showSuffix = false,
    super.key,
  });

  TextEditingController controller = TextEditingController();

  bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  bool? showSuffix;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: (v) {
          if (v!.isEmpty) {
            return '$hintText is required';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: hintText,
          alignLabelWithHint: true,
          hintText: hintText,
          suffix: showSuffix!
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
      ),
    );
  }
}
