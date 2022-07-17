
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/loginCubit/states.dart';
import 'package:social_application/network/cache_helper.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  //late LoginModel loginModel;

bool isPassword=false;
Icon icon=const Icon(Icons.visibility) ;
void changePasswordIcon(){
  isPassword=!isPassword;
  isPassword?icon=const Icon(Icons.visibility):icon= const Icon(Icons.visibility_off);
  emit(LoginChangePasswordIcon());
}

void userLogin({
  required String email,
  required String password,

}){
  emit(LoginLoadingState());
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password).then((value) {
    //print('user email is : ${value.user?.email}');
        CacheHelper.saveData(key: "userID", value: value.user!.uid);
        emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
    emit(LoginErrorState(error.toString()));
    print('error occur :::${error.toString()}');
    });


}

}