abstract class FeedsStates{}
class FeedsInitialState extends FeedsStates{}

class FeedsGetUserLoadingState extends FeedsStates{}
class FeedsGetUserSuccessState extends FeedsStates{}
class FeedsGetUserErrorState extends FeedsStates{
  final String error;
  FeedsGetUserErrorState(this.error);
}

class FeedsGetPostsLoadingState extends FeedsStates{}
class FeedsGetPostsSuccessState extends FeedsStates{}
class FeedsGetPostsErrorState extends FeedsStates{
  final String error;
  FeedsGetPostsErrorState(this.error);
}


class FeedsLikePostLoadingState extends FeedsStates{}
class FeedsLikePostSuccessState extends FeedsStates{}
class FeedsLikePostErrorState extends FeedsStates{
  final String error;
  FeedsLikePostErrorState(this.error);
}

class FeedsCommentOnPostLoadingState extends FeedsStates{}
class FeedsCommentOnPostSuccessState extends FeedsStates{}
class FeedsCommentOnPostErrorState extends FeedsStates{
  final String error;
  FeedsCommentOnPostErrorState(this.error);
}

class FeedsGetUsersLoadingState extends FeedsStates{}
class FeedsGetUsersSuccessState extends FeedsStates{}
class FeedsGetUsersErrorState extends FeedsStates{
  final String error;
  FeedsGetUsersErrorState(this.error);
}