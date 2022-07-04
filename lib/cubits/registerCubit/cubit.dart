import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/registerCubit/states.dart';



class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
 // LoginModel? registerModel;
  bool isPassword=false;
  Icon icon=const Icon(Icons.visibility) ;
  void changePasswordIcon(){
    isPassword=!isPassword;
    isPassword?icon=const Icon(Icons.visibility):icon= const Icon(Icons.visibility_off);
    emit(RegisterChangePasswordIconState());
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,

  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print('user email is : ${value.user?.email}');
      print('user email is : ${value.user?.uid}');
      emit(RegisterSuccessState());
          }
    ).catchError((error) {
      emit(RegisterErrorState(error.toString()),);
      print('error occur ::::${error.toString()} ');
    }
    );
  }

  //   DioHelper.postData(
  //       url: register,
  //       data: {
  //         'name':name,
  //         'email':email,
  //         'password':password,
  //         'phone':phone,
  //       }).then((value) {
  //     print(value.data);
  //     registerModel=LoginModel.fromJson(value.data);
  //     emit(RegisterSuccessState(registerModel!));
  //     print("SSSSSSSSS:::: $state");
  //   }).catchError((error){
  //     emit(RegisterErrorState(error.toString()));
  //     print(error.toString());
  //   });
  // }

}
