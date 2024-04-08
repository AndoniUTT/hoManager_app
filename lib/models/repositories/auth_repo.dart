
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationFirebase{
  Future<User?> get user;
}