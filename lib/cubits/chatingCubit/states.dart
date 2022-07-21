abstract class ChatStates{}
class ChatInitialState extends ChatStates{}

class ChatGetUserLoadingState extends ChatStates{}
class ChatGetUserSuccessState extends ChatStates{}
class ChatGetUserErrorState extends ChatStates{
  final String error;
  ChatGetUserErrorState(this.error);
}

class ChatSendMessageLoadingState extends ChatStates{}
class ChatSendMessageSuccessState extends ChatStates{}
class ChatSendMessageErrorState extends ChatStates{
  final String error;
  ChatSendMessageErrorState(this.error);
}

class ChatGetMessagesLoadingState extends ChatStates{}
class ChatGetMessagesSuccessState extends ChatStates{}
class ChatGetMessagesErrorState extends ChatStates{
  final String error;
  ChatGetMessagesErrorState(this.error);
}
