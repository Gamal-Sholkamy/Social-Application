import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/homeLayoutCubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/network/end_points.dart';
import 'package:social_application/screens/chats/chats.dart';
import 'package:social_application/screens/feeds/feeds.dart';
import 'package:social_application/screens/notifications/notifications.dart';
import 'package:social_application/screens/settings/settings.dart';
import 'package:social_application/screens/users/users.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() :super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
//////
UserModel? userModel;
void getUserData(){
  emit(HomeLayoutLoadingState());
  FirebaseFirestore.instance.collection('users').doc(userID).get().
  then((value) {
    //print('${value.data()}');
      userModel=UserModel.fromJson(value.data()!);
    emit(HomeLayoutGetUserSuccessState());
  }).
  catchError((e){
    emit(HomeLayoutGetUserErrorState(e.toString()));
  });
}
//////
int currentIndex=0;
List<Widget> screens=[const FeedsScreen(),const ChatsScreen(),const UsersScreen(),const SettingsScreen()];
List<String> titles=["Home","Chats","Users","Settings"];
void changeCurrentIndex(int index)
{


    currentIndex=index;
    emit(HomeLayoutChangeBottomNavIndexState());

}
///////




}
