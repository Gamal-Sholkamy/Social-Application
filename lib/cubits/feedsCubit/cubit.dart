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
  print('$state');
  }
  ///get posts
List<PostModel> posts=[];
List<String>postsID=[];
  List<int>likes=[];
  // List<String>comments=[];
void getPosts(){
  emit(FeedsGetPostsLoadingState());
  FirebaseFirestore.instance.collection('posts').get()
      .then((value){
        // value.docs.forEach((element) {
        //   element.reference.collection('comments').get().then((value) =>{}).catchError((onError){});
        // });
        value.docs.forEach((element) {
          element.reference.
          collection('likes').get().
          then((value) {
            likes.add(value.docs.length);
            postsID.add(element.id);
            posts.add(PostModel.fromJson(element.data()));
          }).
          catchError((onError){});

        });
        emit(FeedsGetPostsSuccessState());
  }).catchError((onError){
    emit(FeedsGetPostsErrorState(onError.toString()));
  });
}

void likePost(String postID){
  emit(FeedsLikePostLoadingState());
  FirebaseFirestore.instance.collection('posts').doc(postID).collection('likes').doc(userModel?.userID).set(
      {
        'like':true,
      }).
  then((value) {
    emit(FeedsLikePostSuccessState());
  }).
  catchError((onError){
    emit(FeedsLikePostErrorState(onError.toString()));
  });
}

  // void commentINPost(String postID){
  //   emit(FeedsCommentOnPostLoadingState());
  //   FirebaseFirestore.instance.collection('posts').doc(postID).collection('comments').doc(userModel?.userID).set(
  //       {
  //         'comment':true,
  //       }).
  //   then((value) {
  //     emit(FeedsCommentOnPostSuccessState());
  //   }).
  //   catchError((onError){
  //     emit(FeedsCommentOnPostErrorState(onError.toString()));
  //   });
  // }
  List<UserModel>users=[];
  void getUsers(){
    if(users.isEmpty) {
      emit(FeedsGetUsersLoadingState());
      FirebaseFirestore.instance.collection('users').get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['userID'] != userModel!.userID ) {
            users.add(UserModel.fromJson(element.data()));
          }
        });
        emit(FeedsGetUsersSuccessState());
      }).catchError((onError) {
        emit(FeedsGetUsersErrorState(onError.toString()));
      });
    }
}


}
