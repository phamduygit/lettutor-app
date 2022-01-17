import 'dart:convert';
import 'package:http/http.dart' as http;

class CommonAPI {
  Future<String> getLanguageName(String languageKey) async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/lang/$languageKey',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[0]["languages"][0]["name"];
    } else {
      throw Exception('Failed to load album');
    }
  }
}