import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';

class CountryTextFormField extends StatefulWidget {
  const CountryTextFormField({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<CountryTextFormField> createState() => _CountryTextFormFieldState();
}

class _CountryTextFormFieldState extends State<CountryTextFormField> {
  TextEditingController countryName = TextEditingController();
  
  @override
  void initState() {
    countryName.text = context.read<User>().country; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: countryName,
          readOnly: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your country",
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onSaved: (val) {
            user.country = countryName.text;
            user.updateUser(user);
            UserDAO().update(user);
          },
          onTap: () {
            showCountryPicker(
              context: context,
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: false,
              onSelect: (Country country) {
                setState(() {
                  countryName.text = country.name;
                });
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                // Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
