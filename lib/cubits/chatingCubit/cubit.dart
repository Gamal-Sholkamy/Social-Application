import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_application/cubits/chatingCubit/states.dart';
import 'package:social_application/cubits/feedsCubit/states.dart';
import 'package:social_application/cubits/newPostCubit/states.dart';
import 'package:social_application/models/message_model.dart';
import 'package:social_application/models/post_model.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/network/end_points.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() :super(ChatInitialState());
  static ChatCubit get(context) => BlocProvider.of(context);

UserModel? userModel;
MessageModel? messageModel;
/// //// //// //// ////
void getUserDataToMessage(){
  emit(ChatGetUserLoadingState());
  FirebaseFirestore.instance.collection('users').doc(userID).get().
  then((value) {
      userModel=UserModel.fromJson(value.data()!);
    emit(ChatGetUserSuccessState());

  }).
  catchError((e){
    emit(ChatGetUserErrorState(e.toString()));
  });

  }
  /// Send Message /////////////////////////////////////////////
   void sendMessage({
     required String dateTime,
     required String receiverID,
     required String text,
})
   {

     messageModel=MessageModel(
       text: text,
       senderID: userModel!.userID,
       receiverID: receiverID,
       dateTime: dateTime,
     );
     emit(ChatSendMessageLoadingState());
     /// add message to sender collection
     FirebaseFirestore.instance.
     collection('users').doc(userModel!.userID).
     collection('chats').doc(receiverID).
     collection('messages').add(messageModel!.toMap())
         .then((value) {
        emit(ChatSendMessageSuccessState());
     }).catchError((onError){
       emit(ChatSendMessageErrorState(onError.toString()));
     });
     /// add message to receiver collection
     FirebaseFirestore.instance.
     collection('users').doc(receiverID).
     collection('chats').doc(userModel!.userID).
     collection('messages').add(messageModel!.toMap())
         .then((value) {
       emit(ChatSendMessageSuccessState());
     }).catchError((onError){
       emit(ChatSendMessageErrorState(onError.toString()));
     });

   }

  /// /////////////////////////////////////////////////////////
  ///get Messages
  List<MessageModel> messages=[];
void getMessages(
  {
  required String receiverId,
}
    ){
  FirebaseFirestore.instance.
  collection('users').doc(userModel!.userID!).
  collection('chats').doc(receiverId).
  collection('messages').orderBy('dateTime')
      .snapshots().
  listen((event) {
    messages=[]; 
    event.docs.forEach((element) {
      messages.add(MessageModel.fromJson(element.data()));
    });
    emit(ChatGetMessagesSuccessState());
  });


}


}
