import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthAPI {
  Future<Map<String, dynamic>> registerAccount(
      String email, String password) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/auth/register');
    var response = await http.post(
      url,
      headers: {},
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 201) {
      return {
        "status": 201,
        "message": "Enter your new account in login screen",
      };
    } else if (response.statusCode == 500) {
      var msg = jsonDecode(response.body);
      return {
        "status": 500,
        "message": msg["message"],
      };
    }
    return {};
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/auth/login');
    var response = await http.post(
      url,
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      String token = json["tokens"]["access"]["token"];
      return {"statusCode": 200, "token": token};
    } else if (response.statusCode == 500) {
      var msg = jsonDecode(response.body);
      String message = msg["message"];
      return {"statusCode": 200, "message": message};
    }
    return {};
  }

  Future<Map<String, dynamic>> loginByGoogle(String token) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/auth/google');
    var response = await http.post(
      url,
      body: {
        "access_token": token,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      String token = json["tokens"]["access"]["token"];
      return {"statusCode": 200, "token": token};
    } else if (response.statusCode == 500) {
      var msg = jsonDecode(response.body);
      String message = msg["message"];
      return {"statusCode": 500, "message": message};
    }
    return {};
  }

  Future<Map<String, dynamic>> loginByFacebook(String token) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/auth/facebook');
    var response = await http.post(url, body: {"access_token": token});
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      String token = json["tokens"]["access"]["token"];
      return {"statusCode": 200, "token": token};
    } else if (response.statusCode == 500) {
      var msg = jsonDecode(response.body);
      String message = msg["message"];
      return {"statusCode": 500, "message": message};
    }
    return {};
  }
  Future<String> forgotPassowrd(String email) async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/user/forgotPassword');
    var response = await http.post(url, body: {"email": email});
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"]; 
    } else if (response.statusCode == 500) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["message"]; 
    }
    return "";
  }
}
