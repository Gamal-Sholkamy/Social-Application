

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  // LoginModel registerModel ;
  // RegisterSuccessState(this.registerModel);

}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);

}
class RegisterChangePasswordIconState extends RegisterStates{}
class RegisterCreateUserSuccessState extends RegisterStates{
  final String userID;
  RegisterCreateUserSuccessState(this.userID);
}
class RegisterCreateUserErrorState extends RegisterStates{
  final String error;
  RegisterCreateUserErrorState(this.error);
}