import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:logistics_now/core/utils/routes/route_helper.dart';
import 'package:logistics_now/core/utils/routes/routes.dart';
import 'package:logistics_now/core/widgets/toast.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> authenticateUser(String emailId, String password) async {
    try {
      // Check if the user exists
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailId,
        password: password,
      );
      Toast.info("Login Successful");
      RouteHelper.pushReplacement(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        try {
          await _firebaseAuth.signInWithEmailAndPassword(
            email: emailId,
            password: password,
          );
          Toast.info("Login Successful");
          RouteHelper.pushReplacement(Routes.HOME);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
            Toast.error("Invalid Credentials");
          } else {
            Toast.error(e.toString());
          }
        } catch (e) {
          log('Error authenticating: $e');
          Toast.error("Something went wrong");
        }
      } else if (e.code == "invalid-email") {
        Toast.error("The email is badly formatted");
      } else if (e.code == "weak-password") {
        Toast.error("6 character password is required");
      } else {
        Toast.error("Something went wrong");
      }
    } catch (e) {
      log('Error authenticating: $e');
      Toast.error("Something went wrong");
    }
  }
}
