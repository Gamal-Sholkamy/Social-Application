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


