part of 'bloc.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormValidate> {
  final IAuthenticationRepository _authenticationRepository;
  // final IDatabaseRepository _databaseRepository;
  FormValidator formValidator = FormValidator();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();






  _onEmailChanged(EmailChanged event, Emitter<SignInFormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: formValidator.validPassword(state.password, 8 ,req: true) && formValidator.validEmail(event.email, req: true),
      isFormValidateFailed: false,
      errorMessage: "",
      email: event.email,
      isEmailValid: formValidator.validEmail(event.email, req: true),
    ));
  }

  _onPasswordChanged(PasswordChanged event, Emitter<SignInFormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: formValidator.validPassword(event.password, 8 ,req: true) && formValidator.validEmail(state.email, req: true),
      isFormValidateFailed: false,
      errorMessage: "",
      password: event.password,
      isPasswordValid: formValidator.validPassword(event.password, 8 ,req: true),
    ));

  }

  _onSignInFormSubmitted(SignInFormSubmitted event, Emitter<SignInFormValidate> emit) async {
    UserModel user = UserModel(
      email: state.email,
      password: state.password,
    );

    await _authenticateUser(event, emit, user);
  }

  _authenticateUser(
      SignInFormSubmitted event, Emitter<SignInFormValidate> emit, UserModel user) async {

    final prefs = await SharedPreferences.getInstance();
    emit(
        state.copyWith(errorMessage: "",
            isFormValid: formValidator.validPassword(state.password, 8) &&
                formValidator.validEmail(state.email, req: true),
            isLoading: true));
    if (state.isFormValid) {
      try {
        UserCredential? authUser = await _authenticationRepository.signIn(user);
        UserModel updatedUser = user.copyWith(
            uid: authUser!.user!.uid, isVerified: authUser.user!.emailVerified);
        // await _databaseRepository.saveUserData(updatedUser);
        if (updatedUser.isVerified!) {

          await prefs.setString('uid', authUser.user!.uid);
          emit(state.copyWith(isLoading: true, errorMessage: "", isFormSuccessful: true));
        } else {
          emit(state.copyWith(isFormValid: true,errorMessage: "Please Verify your email, by clicking the link sent to you by mail.",isLoading: false));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.message, isFormValid: true));
      }
    } else {
      emit(state.copyWith(
          isLoading: false, isFormValid: false, isFormValidateFailed: true));
    }
  }
  

  SignInFormBloc(this._authenticationRepository)
      : super(const SignInFormValidate(
      email: "",
      password: "",
      isEmailValid: true,
      isPasswordValid: true,
      isFormValid: false,
      isLoading: false,
      isFormValidateFailed: false)) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInFormSubmitted>(_onSignInFormSubmitted);
    // on<SignInFormSucceeded>(_onSignInFormSucceeded);
  }
}
