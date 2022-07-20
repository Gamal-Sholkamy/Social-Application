abstract class CreatePostStates{}
class CreatePostInitialState extends CreatePostStates{}
class CreatePostLoadingState extends CreatePostStates{}

class CreatePostSuccessState extends CreatePostStates{}
class CreatePostErrorState extends CreatePostStates{
  final String error;
  CreatePostErrorState(this.error);
}

class CreatePostGetUserSuccessState extends CreatePostStates{}
class CreatePostGetUserErrorState extends CreatePostStates{
final String error;
CreatePostGetUserErrorState(this.error);
}


class CreatePostPostImagePickedSuccessState extends CreatePostStates{}
class CreatePostPostImagePickedErrorState extends CreatePostStates{
  // final String error;
  // EditProfileProfileImagePickedErrorState(this.error);
}



class CreatePostPostImageUploadSuccessState extends CreatePostStates{}
class CreatePostPostImageUploadErrorState extends CreatePostStates{
  // final String error;
  // EditProfileProfileImagePickedErrorState(this.error);
}

class CreatePostRemovePostImageState extends CreatePostStates{}

