import 'package:lettutor_app/data/share_preference/local_sp.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ScheduleAPI {
  Future<Map<String, dynamic>> getScheduleById(String tutorId) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/schedule');
    var token = await LocalSP().getAccessToken();
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "tutorId": tutorId,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      // error;
    }
    return {};
  }

  Future<String> bookAClass(String scheduleDetailIds, String note) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/booking');
    var token = await LocalSP().getAccessToken();
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "scheduleDetailIds": [scheduleDetailIds],
        "note": note,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"];
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"];
    }
  }
  Future<Map<String, dynamic>> getUpcomming(int page, int perPage) async {
    int timestamp = DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch;
    var url = Uri.parse('https://sandbox.api.lettutor.com/booking/list/student?page=$page&perPage=$perPage&dateTimeGte=$timestamp&orderBy=meeting&sortBy=asc');
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
  Future<Map<String, dynamic>> getBookedClass(int page, int perPage) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    var url = Uri.parse('https://sandbox.api.lettutor.com/booking/list/student?page=$page&perPage=$perPage&dateTimeLte=$timestamp&orderBy=meeting&sortBy=desc');
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
  Future<String> cancelBookedClass(String scheduleDetailIds) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/booking');
    var token = await LocalSP().getAccessToken();
    var response = await http.delete(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({"scheduleDetailIds":[scheduleDetailIds]}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"];
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"];
    }
  }
}
