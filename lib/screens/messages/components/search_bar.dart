import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _textController,
      prefixInsets: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
    );
  }
}
