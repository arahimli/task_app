part of 'bloc.dart';



abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignInFormEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInFormEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}


class SignInFormSubmitted extends SignInFormEvent {
  const SignInFormSubmitted();

  @override
  List<Object> get props => [];
}

class SignInFormSucceeded extends SignInFormEvent {
  const SignInFormSucceeded();

  @override
  List<Object> get props => [];
}