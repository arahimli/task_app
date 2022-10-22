import '../../uses_cases/models/appeal/appeal.dart';

abstract class IHomeRepository{
  Future<List<AppealModel>> getAppeals();
}