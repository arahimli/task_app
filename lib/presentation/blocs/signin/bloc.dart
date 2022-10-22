import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/uses_cases/common/validator.dart';
import '../../../../domain/uses_cases/models/authentication/user.dart';
import '../../../domain/repositories/authentication/authentication.dart';


part 'signin_bloc.dart';
part 'signin_event.dart';
part 'signin_state.dart';


