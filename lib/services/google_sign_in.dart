import 'package:google_sign_in/google_sign_in.dart';

Future<String> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final googleKey = await googleUser!.authentication;
  return googleKey.accessToken!;
}
