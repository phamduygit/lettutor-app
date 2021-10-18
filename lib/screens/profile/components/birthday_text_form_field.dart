import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayTextFormField extends StatefulWidget {
  const BirthdayTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<BirthdayTextFormField> createState() => _BirthdayTextFormFieldState();
}

class _BirthdayTextFormFieldState extends State<BirthdayTextFormField> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field
  DateTime now = DateTime.now();
  @override
  void initState() {
    dateinput.text = DateFormat('yyyy-MM-dd').format(now); //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Birthday",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: dateinput, //editing controller of this TextField
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today), //icon of text fieldlabel text of field
          ),
          readOnly: true, //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            }
          },
        )
      ],
    );
  }
}
