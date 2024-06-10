import '../Constants/Constants.dart';

class AuthendicationRepo {
  AuthendicationRepo._();

  static Future<AuthStatus> checkStatus() async {
    // final bool hasSigedIn = await https....call your auth server
    await Future<void>.delayed(const Duration(seconds: 3));
    return AuthStatus.SignedOut;
  }
}




































