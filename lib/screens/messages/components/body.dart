import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/people.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController _textController;
  List<People> fliterList = persons;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          CupertinoSearchTextField(
            controller: _textController,
            prefixInsets: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            onChanged: (value) {
              setState(() {
                fliterList = persons
                    .where((element) => element.username
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
          Column(
            children: List.generate(
              fliterList.length,
              (index) => ChatCard(people: fliterList[index]),
            ),
          )
        ],
      ),
    );
  }
}
