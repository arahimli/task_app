
import '../../../domain/repositories/home/home_repository.dart';
import '../../../domain/uses_cases/models/appeal/appeal.dart';
import '../../services/database/database_service.dart';

class HomeRepository implements IHomeRepository{
  DatabaseService service = DatabaseService();

  @override
  Future<List<AppealModel>> getAppeals() {
    return service.getAppeals();
  }

}