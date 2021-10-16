import 'package:flutter/material.dart';

class ReEnterPasswordTextField extends StatefulWidget {
  const ReEnterPasswordTextField({
    Key? key, required this.password, required this.confirmPassword,
  }) : super(key: key);
  final TextEditingController password;
  final TextEditingController confirmPassword;
  @override
  State<ReEnterPasswordTextField> createState() => _ReEnterPasswordTextFieldState();
}

class _ReEnterPasswordTextFieldState extends State<ReEnterPasswordTextField> {
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "CONFIRM PASSWORD",
              style: TextStyle(color: Colors.black45),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: widget.confirmPassword,
          obscureText: !showPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Re-enter your password",
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
              if (value != widget.password.text) {
                return 'Confirm password does not match';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
