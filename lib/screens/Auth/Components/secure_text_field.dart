import 'package:flutter/material.dart';

class SecureTextField extends StatefulWidget {
  const SecureTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SecureTextField> createState() => _SecureTextFieldState();
}

class _SecureTextFieldState extends State<SecureTextField> {
  bool showPassword = false;
  final _text = TextEditingController();
  bool validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Enter your password',
        suffixIcon: SizedBox(
          height: 18.0,
          width: 18.0,
          child: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: showPassword
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            iconSize: 18.0,
          ),
        ),
      ),
    );
  }
}
