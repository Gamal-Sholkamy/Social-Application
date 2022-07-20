import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_application/cubits/feedsCubit/states.dart';
import 'package:social_application/cubits/newPostCubit/states.dart';
import 'package:social_application/models/post_model.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/network/end_points.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class FeedsCubit extends Cubit<FeedsStates> {
  FeedsCubit() :super(FeedsInitialState());
  static FeedsCubit get(context) => BlocProvider.of(context);
/// /// //// ////
UserModel? userModel;
PostModel? postModel;
/// //// //// //// ////
void getUserDataToFeeds(){
  emit(FeedsGetUserLoadingState());
  FirebaseFirestore.instance.collection('users').doc(userID).get().
  then((value) {
    //print('${value.data()}');
      userModel=UserModel.fromJson(value.data()!);
    emit(FeedsGetUserSuccessState());
  }).
  catchError((e){
    emit(FeedsGetUserErrorState(e.toString()));
  });
}
  ///get posts
List<PostModel> posts=[];
void getPosts(){
  emit(FeedsGetPostsLoadingState());
  FirebaseFirestore.instance.collection('posts').get()
      .then((value){
        value.docs.forEach((element) { 
          posts.add(PostModel.fromJson(element.data()));
        });
        emit(FeedsGetPostsSuccessState());
  }).catchError((onError){
    emit(FeedsGetPostsErrorState(onError.toString()));
  });
}






}
