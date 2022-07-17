

abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginChangePasswordIcon extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String userID;
  LoginSuccessState(this.userID);

}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
