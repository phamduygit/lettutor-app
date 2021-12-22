import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';

class BirthdayTextFormField extends StatefulWidget {
  const BirthdayTextFormField({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<BirthdayTextFormField> createState() => _BirthdayTextFormFieldState();
}

class _BirthdayTextFormFieldState extends State<BirthdayTextFormField> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field
  // DateTime now = DateTime.now();
  @override
  void initState() {
    dateinput.text = DateFormat('dd/MM/yyyy').format(context.read<User>().birthDay); //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: dateinput, //editing controller of this TextField
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today), //icon of text fieldlabel text of field
          ),
          readOnly: true, //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: user.birthDay,
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(pickedDate);
              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            }
          },
          onSaved: (val) {
            user.birthDay = DateFormat("dd/MM/yyyy").parse(val!);
            user.updateUser(user);
            UserDAO().update(user);
          },
        )
      ],
    );
  }
}
