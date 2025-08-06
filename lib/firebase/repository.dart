import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocceryplus/firebase/helper.dart';

class AuthResult {
  final bool FirebaseResult;
  final String Message;

  AuthResult({required this.FirebaseResult, required this.Message});
}

class Repository extends Helper {
  final auth = FirebaseAuth.instance;

  Future<AuthResult> SendOTP({
    required String message,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    try {
      print('In the try Block for the respository class');
      await auth.verifyPhoneNumber(
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
      return AuthResult(FirebaseResult: true, Message: '');
    } on FirebaseException catch (e) {
      print('In the Catch Block for the respository class');
      return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
    }
  }

  Future<AuthResult> SetPassword({required String password}) async {
    User? usr = FirebaseAuth.instance.currentUser;
    try {
      if (usr != null) {
        await SetPassword(password: password);
        await usr.reload();
        return AuthResult(
          FirebaseResult: true,
          Message: 'password Set Successfully',
        );
      } else {
        return AuthResult(
          FirebaseResult: false,
          Message: 'Cannot set the Password',
        );
      }
    } catch (e) {
      print('inside exception block of update Password of repo class');
      return AuthResult(FirebaseResult: false, Message: '$e');
    }
  }

  Future<AuthResult> UpdateName({required String name}) async {
    User? usr = FirebaseAuth.instance.currentUser;
    try {
      if (usr != null) {
        await UpdateName(name: name);
        await usr.reload();
        return AuthResult(
          FirebaseResult: true,
          Message: 'Name Set Successfully',
        );
      } else {
        return AuthResult(
          FirebaseResult: false,
          Message: 'Cannot set the Name',
        );
      }
    } catch (e) {
      print('inside exception block of update name of repo class');
      return AuthResult(FirebaseResult: false, Message: '$e');
    }
  }

  Future<void> SignOut() async {
    await auth.signOut();
  }
}
