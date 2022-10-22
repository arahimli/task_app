part of 'bloc.dart';


abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  final String? uid;
  final String? fullName;
  const AuthenticationSuccess({this.fullName, this.uid});

  @override
  List<Object?> get props => [fullName, uid];
}

class AuthenticationFailure extends AuthenticationState {
  @override
  List<Object?> get props => [];
}