import 'package:flutter/material.dart';

class ReEnterPasswordFormField extends StatefulWidget {
  const ReEnterPasswordFormField({
    Key? key, required this.titleTextFiled, required this.placeHolder, required this.password, required this.confirmPassword,
  }) : super(key: key);
  final String titleTextFiled;
  final String placeHolder;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  @override
  State<ReEnterPasswordFormField> createState() => _ReEnterPasswordFormFieldState();
}

class _ReEnterPasswordFormFieldState extends State<ReEnterPasswordFormField> {
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
          children: [
            Text(
              widget.titleTextFiled,
              style: const TextStyle(color: Colors.black45),
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
            hintText: widget.placeHolder,
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
