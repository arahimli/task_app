part of 'bloc.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository _authenticationRepository;
  String? uid;
  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {

      final prefs = await SharedPreferences.getInstance();
      if (event is AuthenticationStarted) {
        UserModel user = await _authenticationRepository.getCurrentUser().first;
        if (user.uid != "uid") {
          await prefs.setString('uid', user.uid ?? '');
          uid = user.uid;

          String? fullNAme = await _authenticationRepository.retrieveUserName(user);
          emit(AuthenticationSuccess(fullName: fullNAme, uid: user.uid));
        } else {
          emit(AuthenticationFailure());
        }
      }
      else if(event is AuthenticationSignedOut){
        await _authenticationRepository.signOut();
        emit(AuthenticationFailure());
      }
    });
  }
}