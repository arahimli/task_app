import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/repositories/authentication/authentication.dart';
import '../../../domain/uses_cases/models/authentication/user.dart';

part 'authentication_bloc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';