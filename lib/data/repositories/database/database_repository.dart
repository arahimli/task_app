
import '../../../domain/repositories/database/database_repository.dart';
import '../../../domain/uses_cases/models/authentication/user.dart';
import '../../services/database/database_service.dart';

class DatabaseRepository implements IDatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> saveUserData(UserModel user) {
    return service.addUserData(user);
  }

  @override
  Future<List<UserModel>> retrieveUserData() {
    return service.retrieveUserData();
  }


}
