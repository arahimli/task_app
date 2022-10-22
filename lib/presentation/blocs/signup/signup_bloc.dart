part of 'bloc.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormValidate> {
  final IAuthenticationRepository _authenticationRepository;
  final IDatabaseRepository _databaseRepository;
  FormValidator formValidator = FormValidator();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  bool _checkFormValid({required String fullName, required String email, required String password, }){
    return formValidator.validPassword(password, 8 ,req: true) && formValidator.validFullName(fullName, req: true) && formValidator.validEmail(email, req: true);
  }

  _onFullNameChanged(FullNameChanged event, Emitter<SignUpFormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: _checkFormValid(fullName: event.fullName, email: state.email, password: state.password),
      isFormValidateFailed: false,
      errorMessage: "",
      fullName: event.fullName,
      isFullNameValid: formValidator.validFullName(event.fullName, req: true),
    ));
  }


  _onEmailChanged(EmailChanged event, Emitter<SignUpFormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: _checkFormValid(fullName: state.fullName, email: event.email, password: state.password),
      isFormValidateFailed: false,
      errorMessage: "",
      email: event.email,
      isEmailValid: formValidator.validEmail(event.email, req: true),
    ));
  }

  _onPasswordChanged(PasswordChanged event, Emitter<SignUpFormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: _checkFormValid(fullName: state.fullName, email: state.email, password: event.password),
      isFormValidateFailed: false,
      errorMessage: "",
      password: event.password,
      isPasswordValid: formValidator.validPassword(event.password, 8 ,req: true),
    ));

  }

  _onSignUpFormSubmitted(SignUpFormSubmitted event, Emitter<SignUpFormValidate> emit) async {
    UserModel user = UserModel(
      fullName: state.fullName,
      email: state.email,
      password: state.password,
    );

    await _authenticateUser(event, emit, user);
  }

  _authenticateUser(
      SignUpFormSubmitted event, Emitter<SignUpFormValidate> emit, UserModel user) async {
    // final prefs = await SharedPreferences.getInstance();
    emit(
        state.copyWith(errorMessage: "",
            isFormValid: formValidator.validPassword(state.password, 8) &&
                formValidator.validEmail(state.email, req: true),
            isLoading: true));
    if (state.isFormValid) {
      try {
        UserCredential? authUser = await _authenticationRepository.signUp(user);
        UserModel updatedUser = user.copyWith(
            uid: authUser!.user!.uid, isVerified: authUser.user!.emailVerified);
        await _databaseRepository.saveUserData(updatedUser);
        resetForm();
          emit(state.copyWith(isFormSuccessful: true, isLoading: false, errorMessage: "",
            fullName: "",
            email: "",
            password: "",
            warningMessage: "Please Verify your email, by clicking the link sent to you by mail.",
            isFullNameValid: true,
            isEmailValid: true,
            isPasswordValid: true,
            isFormValid: false,));
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.message, isFormValid: true));
      }
    } else {
      emit(state.copyWith(
          isLoading: false, isFormValid: false, isFormValidateFailed: true));
    }
  }
  

  SignUpFormBloc(this._authenticationRepository, this._databaseRepository)
      : super(const SignUpFormValidate(
      fullName: "",
      email: "",
      password: "",
      errorMessage: "",
      warningMessage: "",
      isFullNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isFormValid: false,
      isLoading: false,
      isFormSuccessful: false,
      isFormValidateFailed: false)) {
    on<FullNameChanged>(_onFullNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignUpFormSubmitted>(_onSignUpFormSubmitted);
    // on<FormSucceeded>(_onFormSucceeded);
  }

  resetForm() async{
    fullNameController.text = '';
    emailController.text = '';
    passwordController.text = '';

  }

}
