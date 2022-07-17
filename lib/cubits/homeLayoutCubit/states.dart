abstract class HomeLayoutStates{}
class HomeLayoutInitialState extends HomeLayoutStates{}
class HomeLayoutLoadingState extends HomeLayoutStates{}
class HomeLayoutGetUserSuccessState extends HomeLayoutStates{}
class HomeLayoutGetUserErrorState extends HomeLayoutStates{
  final String error;
  HomeLayoutGetUserErrorState(this.error);
}
class HomeLayoutChangeBottomNavIndexState extends HomeLayoutStates{}
class HomeLayoutNewPostState extends HomeLayoutStates{}

