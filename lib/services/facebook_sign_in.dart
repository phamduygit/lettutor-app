import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<String> signInWithFacebook() async {
  final results = await FacebookAuth.instance.login();
  final token = results.accessToken!.token;
  return token;
}
