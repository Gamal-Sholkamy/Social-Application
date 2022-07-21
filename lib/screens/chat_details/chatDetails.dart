import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/chatingCubit/cubit.dart';
import 'package:social_application/cubits/chatingCubit/states.dart';
import 'package:social_application/models/message_model.dart';
import 'package:social_application/models/user_model.dart';

class ChatDetails extends StatelessWidget{
  UserModel userModel;
  ChatDetails(this.userModel, {Key? key}) : super(key: key);
  final _messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (BuildContext context )=>ChatCubit()..getMessages(receiverId: userModel.userID!),
   child:  BlocConsumer<ChatCubit,ChatStates>(
     listener: (context,state){},
     builder: (context,state){
       ChatCubit chatCubit=ChatCubit.get(context);
       MessageModel messageModel=chatCubit.messageModel!;

       if(chatCubit.messages.isNotEmpty){
         return Scaffold(
           appBar: AppBar(
             titleSpacing: 0.0,
             title: Row(
               children: [
                 CircleAvatar(
                   radius: 20.0,
                   backgroundImage: NetworkImage('${userModel.image!}'),
                 ),
                 const SizedBox(
                   width: 15,
                 ),
                 Text('${userModel.name!}')

               ],),
           ),
           body: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               children: [
                Expanded(child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      var message=chatCubit.messages[index];
                      if(chatCubit.userModel!.userID==message.senderID){
                        return buildMyMessage(message);
                      }
                       return buildMessage(message);
                    },
                    separatorBuilder: (context ,index)=>const SizedBox(height: 15,),
                    itemCount: chatCubit.messages.length ),),
                 Container(
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0

                     ),
                     borderRadius: BorderRadius.circular(8.0),

                   ),
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   child: Row(

                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: _messageController,
                           decoration: const InputDecoration(
                               border: InputBorder.none,
                               hintText: "Type your message "
                           ),
                         ),
                       ),
                       Container(
                         height: 40,
                         width: 50,
                         color: Theme.of(context).primaryColor,
                         child: OutlinedButton(

                             onPressed: (){
                               chatCubit.sendMessage(dateTime: DateTime.now().toString(),
                                   receiverID: userModel.userID!,
                                   text:_messageController.text );
                             },
                             child:  Icon(Icons.send,size: 16,color: Theme.of(context).scaffoldBackgroundColor,) ),
                       )

                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
       }
       else{
         return const Center(child:CircularProgressIndicator() ,);
       }
     },
   ),
   );
  }

  Widget buildMessage(MessageModel model)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),

          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5.0,
        ),
        child:  Text("${model.text}")),
  );
  Widget buildMyMessage(MessageModel model)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        decoration:  BoxDecoration(
          color: Colors.blue.withOpacity(.2),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),

          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5.0,
        ),
        child:  Text("${model.text}")),
  );
}