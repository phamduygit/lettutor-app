import 'package:flutter/material.dart';
import 'secure_text_field.dart';

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _text = TextEditingController();
  bool _validate = false;

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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _text.text.isEmpty ? _validate = true : _validate = false;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          ),
          child: Row(
            children: const [
              Spacer(),
              Text(
                "LOG IN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
