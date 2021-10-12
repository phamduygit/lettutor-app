import 'package:flutter/material.dart';

class SecureTextField extends StatefulWidget {
  const SecureTextField({
    Key? key, required this.titleTextFiled, required this.placeHolder,
  }) : super(key: key);
  final String titleTextFiled;
  final String placeHolder;
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
        TextField(
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
        ),
      ],
    );
  }
}
