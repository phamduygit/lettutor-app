import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lettutor_app/data/share_preference/local_sp.dart';

class TutorAPI {
  Future<Map<String, dynamic>> getListTutorWithPagination(
      int perPage, int page, String studentRequest) async {
    var url = Uri.parse(
        'https://sandbox.api.lettutor.com/tutor/more?perPage=$perPage&page=$page');
    var token = await LocalSP().getAccessToken();
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      // error;
    }
    return {};
  }
  Future<Map<String, dynamic>> getTutorInfoById(String tutorid) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/tutor/$tutorid');
    var token = await LocalSP().getAccessToken();
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
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
