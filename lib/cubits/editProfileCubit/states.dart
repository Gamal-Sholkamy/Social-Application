abstract class EditProfileStates{}
class EditProfileInitialState extends EditProfileStates{}
class EditProfileLoadingState extends EditProfileStates{}
class EditProfileGetUserSuccessState extends EditProfileStates{}
class EditProfileGetUserErrorState extends EditProfileStates{
  final String error;
  EditProfileGetUserErrorState(this.error);
}

class EditProfileProfileImagePickedSuccessState extends EditProfileStates{}
class EditProfileProfileImagePickedErrorState extends EditProfileStates{
  // final String error;
  // EditProfileProfileImagePickedErrorState(this.error);
}


class EditProfileCoverImagePickedSuccessState extends EditProfileStates{}
class EditProfileCoverImagePickedErrorState extends EditProfileStates{
  // final String error;
  // EditProfileCoverImagePickedErrorState(this.error);
}


class EditProfileUploadProfileImageSuccessState extends EditProfileStates{}
class EditProfileUploadProfileImageErrorState extends EditProfileStates{
  // final String error;
  // EditProfileCoverImagePickedErrorState(this.error);
}

class EditProfileUploadCoverImageSuccessState extends EditProfileStates{}
class EditProfileUploadCoverImageErrorState extends EditProfileStates{
  // final String error;
  // EditProfileCoverImagePickedErrorState(this.error);
}


class EditProfileUpdateUserLoadingState extends EditProfileStates{}
class EditProfileUpdateUserErrorState extends EditProfileStates{
  final String error;
  EditProfileUpdateUserErrorState(this.error);
}