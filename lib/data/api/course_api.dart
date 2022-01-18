import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lettutor_app/data/share_preference/local_sp.dart';

class CourseAPI {
  Future<Map<String, dynamic>> getListCourses(int page, int size) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/course?page=$page&size=$size');
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
  Future<Map<String, dynamic>> getCourseById(String id) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/course/$id');
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
