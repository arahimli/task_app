part of 'bloc.dart';


abstract class SignUpFormState extends Equatable {
  const SignUpFormState();
}

class FormInitial extends SignUpFormState {
  @override
  List<Object?> get props => [];
}

class SignUpFormValidate extends SignUpFormState {
  const SignUpFormValidate(
      { 
        required this.fullName,
        required this.email,
        required this.password,
        required this.isFullNameValid,
        required this.isEmailValid,
        required this.isPasswordValid,
        required this.isFormValid,
        required this.isLoading,
        this.errorMessage = "",
        this.warningMessage = "",
        required this.isFormValidateFailed,
        this.isFormSuccessful = false});

  final String fullName;
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isFullNameValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final String warningMessage;
  final bool isFormSuccessful;

  SignUpFormValidate copyWith(
      {
        String? fullName,
        String? email,
        String? password,
        bool? isFullNameValid,
        bool? isEmailValid,
        bool? isPasswordValid,
        bool? isFormValid,
        bool? isLoading,
        int? age,
        String? errorMessage,
        String? warningMessage,
        bool? isNameValid,
        bool? isAgeValid,
        bool? isFormValidateFailed,
        bool? isFormSuccessful}) {
    return SignUpFormValidate(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        isFullNameValid: isFullNameValid ?? this.isFullNameValid,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        warningMessage: warningMessage ?? this.warningMessage,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    password,
    isFullNameValid,
    isEmailValid,
    isPasswordValid,
    isFormValid,
    isLoading,
    errorMessage,
    warningMessage,
    isFormValidateFailed,
    isFormSuccessful
  ];
}