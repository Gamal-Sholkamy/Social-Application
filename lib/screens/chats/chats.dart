import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/feedsCubit/cubit.dart';
import 'package:social_application/cubits/feedsCubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/screens/chat_details/chatDetails.dart';

class ChatsScreen extends StatelessWidget{
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedsCubit,FeedsStates>(
         listener: (context,state){},
          builder: (context,state){
           final FeedsCubit feedsCubit=FeedsCubit.get(context);

           return Scaffold(
            body: ListView.separated(
                itemBuilder: (context,index)=>buildChatItem(feedsCubit.users[index],context),
                separatorBuilder:(context,index)=>Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.blue,

                ) ,
                itemCount: feedsCubit.users.length),
           );
          },

    );
  }

  Widget buildChatItem(UserModel model,BuildContext context)=>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatDetails(model)));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("${model.image}"),
          ),
          const SizedBox(width: 10,),
          Text(
            '${model.name}',
            style: const TextStyle(height: 1.4),)
        ],
      ),
    ),
  );
}