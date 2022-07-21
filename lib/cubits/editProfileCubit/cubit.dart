import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_application/cubits/editProfileCubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/network/end_points.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() :super(EditProfileInitialState());

  static EditProfileCubit get(context) => BlocProvider.of(context);
//////
  UserModel? userModel;
  void getUserProfileData(){
    emit(EditProfileInitialState());
    FirebaseFirestore.instance.collection('users').doc(userID).get().
    then((value) {
      //print('${value.data()}');
      userModel=UserModel.fromJson(value.data()!);
      emit(EditProfileGetUserSuccessState());
    }).
    catchError((e){
      emit(EditProfileGetUserErrorState(e.toString()));
    });
  }
///edit profile image
  File? profileImage;
  final picker=ImagePicker();
  Future<void> getProfileImage() async{
    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile !=null){
      profileImage=File(pickedFile.path);
      emit(EditProfileProfileImagePickedSuccessState());
    }
    else {
      emit(EditProfileProfileImagePickedErrorState());
      print('No image selected');
    }
  }
  File?  coverImage;

  Future<void> getCoverImage() async{
    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile !=null){
      coverImage=File(pickedFile.path);
      emit(EditProfileCoverImagePickedSuccessState());
    }
    else {
      emit(EditProfileCoverImagePickedErrorState());
      print('No image selected');
    }
  }

  void uploadProfileImage({
    required String name ,
    required String phone  ,
    required String bio  ,
}){

    firebase_storage.FirebaseStorage.instance.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}').
    putFile(profileImage!).
    then((value) {
      value.ref.getDownloadURL().then((value)  {
        getUserProfileData();
        emit(EditProfileUploadProfileImageSuccessState());

        updateUser(
          name: name ,
          phone: phone,
          bio: bio,
          image: value,

        );
      }).catchError((e){
        emit(EditProfileUploadProfileImageErrorState());
      });
    }).
    catchError((onError){
      emit(EditProfileUploadProfileImageErrorState());

    });

  }

  void uploadCoverImage({
    required String name ,
    required String phone  ,
    required String bio  ,
}){

    firebase_storage.FirebaseStorage.instance.ref().child('users/${Uri.file(coverImage!.path).pathSegments.last}').
    putFile(coverImage!).
    then((value) {
      value.ref.getDownloadURL().then((value)  {
        getUserProfileData();
        emit(EditProfileUploadCoverImageSuccessState());
        updateUser(
          name: name ,
          phone: phone,
          bio: bio,
          cover: value,

        );
      }).catchError((e){
        emit(EditProfileUploadCoverImageErrorState());
      });
    }).
    catchError((onError){
      emit(EditProfileUploadCoverImageErrorState());

    });

  }

void updateUser({
  required String name ,
  required String phone  ,
  required String bio  ,
  String? image,
  String? cover,
}){
    emit(EditProfileUpdateUserLoadingState());
    if(coverImage!=null){
      uploadCoverImage(name: name,phone: phone,bio: bio);


    }
    else if(profileImage !=null){
      uploadProfileImage(name: name,phone: phone,bio: bio);

    }

    else{
      userModel =UserModel(
        name: name,
        email: userModel!.email,
        phone: phone,
        image: image?? userModel!.image,
        cover: cover?? userModel!.cover,
        bio: bio,
        userID: userModel!.userID,

      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel!.userID)
          .update(userModel!.toMap())
          .then((value)  {
        getUserProfileData();
      })
          .catchError((e){
        emit(EditProfileUpdateUserErrorState(e.toString()));
      });
    }


}

}