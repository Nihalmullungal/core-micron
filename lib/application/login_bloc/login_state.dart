abstract class LoginState {}

class LoginInitalState extends LoginState {}

class LoginCheckingState extends LoginState {}

class LoginRedirectingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginUserErrorState extends LoginState {}

class LoginPasswordErrorState extends LoginState {}

class LoginFailedState extends LoginState {}
