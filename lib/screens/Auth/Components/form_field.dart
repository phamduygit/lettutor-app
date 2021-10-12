import 'package:flutter/material.dart';
import 'default_button.dart';
import 'secure_text_field.dart';

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _text = TextEditingController();
  bool _validate = false;
  void isClickLogin() {
    setState(() {
      _text.text.isEmpty ? _validate = true : _validate = false;
    });
  }

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
              "EMAIL",
              style: TextStyle(color: Colors.black45),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter your email',
            errorText: _validate ? 'Value Can\'t Be Empty' : null,
          ),
        ),
        const SizedBox(height: 15),
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
        const SecureTextField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text("Forget Password?"),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 10),
        DefaultButton(
          content: 'LOG IN',
          press: isClickLogin,
        ),
      ],
    );
  }
}
