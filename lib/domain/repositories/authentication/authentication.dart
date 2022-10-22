
import '../../uses_cases/models/authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationRepository{
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<void> signOut();
  Future<String?> retrieveUserName(UserModel user);
}