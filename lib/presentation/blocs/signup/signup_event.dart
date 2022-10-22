part of 'bloc.dart';



abstract class SignUpFormEvent extends Equatable {
  const SignUpFormEvent();

  @override
  List<Object> get props => [];
}

class FullNameChanged extends SignUpFormEvent {
  final String fullName;
  const FullNameChanged(this.fullName);

  @override
  List<Object> get props => [fullName];
}


class EmailChanged extends SignUpFormEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignUpFormEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}


class SignUpFormSubmitted extends SignUpFormEvent {
  const SignUpFormSubmitted();

  @override
  List<Object> get props => [];
}

class SignUpFormSucceeded extends SignUpFormEvent {
  const SignUpFormSucceeded();

  @override
  List<Object> get props => [];
}