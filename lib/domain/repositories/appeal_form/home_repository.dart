
import 'dart:io';

import '../../uses_cases/models/appeal/appeal.dart';

abstract class IAppealFormRepository{
  Future<void> addAppealData(AppealModel appealData, List<File> files);
}