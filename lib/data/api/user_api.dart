import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lettutor_app/data/share_preference/local_sp.dart';

class UserAPI {
  Future<Map<String, dynamic>> getUserInformation(String token) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/user/info');
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      // error;
    }
    return {};
  }

  Future<Map<String, dynamic>> updateUserInformation(Object data) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/user/info');
    var token = await LocalSP().getAccessToken();
    var response = await http.put(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        // HttpHeaders.contentTypeHeader: 'application/json',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      // error;
    }
    return {};
  }
}
