
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/homeLayoutCubit/cubit.dart';
import 'package:social_application/cubits/homeLayoutCubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/screens/new_post/newPost.dart';

class HomeLayout extends StatelessWidget{
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
       listener: (context,state){
         if(state is HomeLayoutNewPostState){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewPostScreen()));
         }
       },
      builder: (context,state){
        final HomeLayoutCubit homeLayoutCubit=HomeLayoutCubit.get(context);
        UserModel? model=homeLayoutCubit.model ;
         return Scaffold(
           appBar: AppBar(
             title: Text(homeLayoutCubit.titles[homeLayoutCubit.currentIndex],style: Theme.of(context).textTheme.bodyText1,),
           actions: [
             IconButton(onPressed: (){}, icon: const Icon(Icons.notification_important)),
             IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
           ],
           ),
           body: homeLayoutCubit.screens[homeLayoutCubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             currentIndex: homeLayoutCubit.currentIndex,
             onTap: (index){
               homeLayoutCubit.changeCurrentIndex(index);
             },
             items: const [
               BottomNavigationBarItem(
                   icon: Icon(Icons.home_sharp),
                 label: "Home"
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.mark_as_unread_sharp),
                   label: "Chats"
               ),
               // BottomNavigationBarItem(
               //     icon: Icon(Icons.add_comment_rounded),
               //     label: "Post"
               // ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.man_sharp),
                   label: "Users"
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.settings),
                   label: "Settings"
               ),
             ],
           ),
         );
      },
   );
  }
}