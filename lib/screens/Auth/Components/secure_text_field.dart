import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key, required this.savePassword,
  }) : super(key: key);
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
  final void Function(String?) savePassword;
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "PASSWORD",
              style: TextStyle(color: Colors.black45),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextFormField(
          obscureText: !showPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Enter your password",
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            else {
              if (value.length < 8) {
                return 'Password at least 8 charactor';
              }
            }
            return null;
          },
          onSaved: (value) {
            widget.savePassword(value);
          },
        ),
      ],
    );
  }
}
