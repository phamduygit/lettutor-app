import 'package:flutter/material.dart';

import 'components/body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
      ),
      body: const Body(),
    );
  }
}
