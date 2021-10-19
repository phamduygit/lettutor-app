import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailTeacher extends StatelessWidget {
  const DetailTeacher({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Teacher"),),
      body: const Body(),
      backgroundColor: Colors.white,
    );
  }
}