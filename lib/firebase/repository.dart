import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocceryplus/firebase/helper.dart';

class AuthResult {
  final bool FirebaseResult;
  final String Message;

  AuthResult({required this.FirebaseResult, required this.Message});
}

class Repository extends Helper {
  final auth = FirebaseAuth.instance;

  Future<AuthResult> Login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential usr = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (usr.user != null) {
        usr.user!.reload();
        return AuthResult(FirebaseResult: true, Message: 'Login Successful');
      } else {
        return AuthResult(FirebaseResult: false, Message: 'User is null');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
    }
  }

  Future<AuthResult> Register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential usr = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (usr.user != null) {
        usr.user!.reload();
        usr.user!.updateDisplayName(name);
        return AuthResult(
          FirebaseResult: true,
          Message: 'User Registered Successful',
        );
      } else {
        return AuthResult(FirebaseResult: false, Message: 'User is null');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
    }
  }

  // Future<AuthResult> SendOTP({
  //   required String message,
  //   required PhoneVerificationCompleted verificationCompleted,
  //   required PhoneVerificationFailed verificationFailed,
  //   required PhoneCodeSent codeSent,
  //   required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  // }) async {
  //   try {
  //     print('In the try Block for the respository class');
  //     await auth.verifyPhoneNumber(
  //       phoneNumber: message,
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //     );
  //     return AuthResult(FirebaseResult: true, Message: '');
  //   } on FirebaseException catch (e) {
  //     print('In the Catch Block for the respository class');
  //     return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
  //   }
  // }

  // Future<AuthResult> GetPhoneNum(String phoneNumber) async {
  //   try {
  //     print('in Try block of getphone method of repo class');
  //     final number = await auth.signInWithPhoneNumber(phoneNumber);
  //     return AuthResult(FirebaseResult: true, Message: '');
  //   } on FirebaseAuthException catch (e) {
  //     print('Exception in GEtphone method of Repo class');
  //     Get.snackbar('Error Sending OTP', '');
  //     return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
  //   }
  // }

  // Future<AuthResult> verifyOTP({
  //   required String verificationId,
  //   required String smsCode,
  // }) async {
  //   try {
  //     final credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //     await auth.signInWithCredential(credential);
  //     return AuthResult(
  //       FirebaseResult: true,
  //       Message: 'OTP verifed Successfully',
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
  //   }
  // }

  // Future<AuthResult> SetPassword({required String password}) async {
  //   User? usr = FirebaseAuth.instance.currentUser;
  //   try {
  //     if (usr != null) {
  //       await SetPassword(password: password);
  //       await usr.reload();
  //       return AuthResult(
  //         FirebaseResult: true,
  //         Message: 'password Set Successfully',
  //       );
  //     } else {
  //       return AuthResult(
  //         FirebaseResult: false,
  //         Message: 'Cannot set the Password',
  //       );
  //     }
  //   } catch (e) {
  //     print('inside exception block of update Password of repo class');
  //     return AuthResult(FirebaseResult: false, Message: '$e');
  //   }
  // }

  // Future<AuthResult> UpdateName({required String name}) async {
  //   User? usr = FirebaseAuth.instance.currentUser;
  //   try {
  //     if (usr != null) {
  //       await usr.updateDisplayName(name);
  //       await usr.reload();
  //       return AuthResult(
  //         FirebaseResult: true,
  //         Message: 'Name Set Successfully',
  //       );
  //     } else {
  //       return AuthResult(
  //         FirebaseResult: false,
  //         Message: 'Cannot set the Name',
  //       );
  //     }
  //   } catch (e) {
  //     print('inside exception block of update name of repo class');
  //     return AuthResult(FirebaseResult: false, Message: '$e');
  //   }
  // }

  //*google signin
  Future<AuthResult> SignInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Step 1: Attempt Google sign-in
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return AuthResult(
          FirebaseResult: false,
          Message: 'User cancelled sign-in',
        );
      }

      // Step 2: Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Step 3: Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in with Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      return AuthResult(FirebaseResult: true, Message: 'Sign-in successful');
    } on FirebaseAuthException catch (e) {
      return AuthResult(FirebaseResult: false, Message: FirebaseHelper(e));
    } catch (e) {
      return AuthResult(
        FirebaseResult: false,
        Message: 'Unexpected error: ${e.toString()}',
      );
    }
  }

  Future<void> Passreset({required String email}) async {
  
    try {
      
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('Something Wrong Occured, try again later: ${FirebaseHelper(e)}');
    }
  }

  Future<void> SignOut() async {
    await auth.signOut();
  }
}
