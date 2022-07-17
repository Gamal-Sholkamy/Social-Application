import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/registerCubit/states.dart';
import 'package:social_application/models/user_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() :super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // LoginModel? registerModel;
  bool isPassword = false;
  Icon icon = const Icon(Icons.visibility);

  void changePasswordIcon() {
    isPassword = !isPassword;
    isPassword ? icon = const Icon(Icons.visibility) : icon =
    const Icon(Icons.visibility_off);
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
      //emit(RegisterSuccessState());
      userCreate(name: name, email: email, phone: phone, userID: value.user!.uid);
    }
    ).catchError((error) {
      emit(RegisterErrorState(error.toString()),);
      print('error occur ::::${error.toString()} ');
    }
    );
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String userID,
    // bool? isEmailVerified,

  }) {
    UserModel model =UserModel(
      name: name,
      email: email,
      phone: phone,
      userID: userID,
      image: "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?w=740&t=st=1658063469~exp=1658064069~hmac=d90089a60d2f137f4d07443ce14bd72f9c2761287847a60a343c84ce4f3263e4",
      cover: "https://img.freepik.com/free-photo/happy-young-woman-sitting-floor-using-laptop-gray-wall_231208-11480.jpg?size=626&ext=jpg&uid=R30639821&ga=GA1.2.91118807.1657976754",
        bio: "write your bio ....."
      //isEmailVerified: isEmailVerified,
    );
    FirebaseFirestore.instance.collection("users").doc(userID).set(model.toMap()).
    then((value){
      emit(RegisterCreateUserSuccessState(userID));
      
    }
    ).catchError((error){
      emit(RegisterCreateUserErrorState(error.toString()));
    });
  }


}
