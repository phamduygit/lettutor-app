import 'dart:convert';
import 'dart:io';
import 'dart:math';

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

  Future<Map<String, dynamic>> searchTutor(
      int perPage, int page, List<String> specialties, String key) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/tutor/search');
    var token = await LocalSP().getAccessToken();
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        {
          "filters": {
            "specialties": specialties,
          },
          "page": page,
          "perPage": perPage,
          "search": key
        },
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      // error;
    }
    return {};
  }

  Future<bool> addTutorToFavorites(String tutorId) async {
    var url =
        Uri.parse('https://sandbox.api.lettutor.com/user/manageFavoriteTutor');
    var token = await LocalSP().getAccessToken();
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        {
          "tutorId": tutorId,
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      // error;
    }
    return false;
  }

  Future<bool> writeReview(String bookindId, String userId, int rating, String content) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/user/feedbackTutor');
    var token = await LocalSP().getAccessToken();
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "bookingId": bookindId,
        "userId": userId,
        "rating": rating,
        "content": content,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print(json["message"]);
      return true;
    } else {
      // error;
    }
    Map<String, dynamic> json = jsonDecode(response.body);
      print(json["message"]);
    return false;
  }
}
