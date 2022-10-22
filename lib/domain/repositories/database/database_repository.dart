
import '../../uses_cases/models/authentication/user.dart';

abstract class IDatabaseRepository {
  Future<void> saveUserData(UserModel user);
  Future<List<UserModel>> retrieveUserData();
}