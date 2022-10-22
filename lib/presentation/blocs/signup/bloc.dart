import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/database/database_repository.dart';
import '../../../../domain/uses_cases/common/validator.dart';
import '../../../../domain/uses_cases/models/authentication/user.dart';
import '../../../domain/repositories/authentication/authentication.dart';


part 'signup_bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';


