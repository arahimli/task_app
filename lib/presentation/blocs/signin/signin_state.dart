part of 'bloc.dart';


abstract class SignInFormState extends Equatable {
  const SignInFormState();
}

class FormInitial extends SignInFormState {
  @override
  List<Object?> get props => [];
}

class SignInFormValidate extends SignInFormState {
  const SignInFormValidate(
      {required this.email,
        required this.password,
        required this.isEmailValid,
        required this.isPasswordValid,
        required this.isFormValid,
        required this.isLoading,
        this.errorMessage = "",
        required this.isFormValidateFailed,
        this.isFormSuccessful = false});

  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;

  SignInFormValidate copyWith(
      {String? email,
        String? password,
        String? fullName,
        bool? isEmailValid,
        bool? isPasswordValid,
        bool? isFormValid,
        bool? isLoading,
        int? age,
        String? errorMessage,
        bool? isNameValid,
        bool? isAgeValid,
        bool? isFormValidateFailed,
        bool? isFormSuccessful}) {
    return SignInFormValidate(
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isEmailValid,
    isPasswordValid,
    isFormValid,
    isLoading,
    errorMessage,
    isFormValidateFailed,
    isFormSuccessful
  ];
}