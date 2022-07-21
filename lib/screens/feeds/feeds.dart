import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_application/cubits/feedsCubit/cubit.dart';
import 'package:social_application/cubits/feedsCubit/states.dart';
import 'package:social_application/models/post_model.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/screens/new_post/newPost.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedsCubit,FeedsStates>(
         listener: (context,state){},
         builder: (context,state){
           final FeedsCubit feedsCubit=FeedsCubit.get(context);
           final UserModel userModel=feedsCubit.userModel!;
           final UserModel postModel=feedsCubit.userModel!;
           if(state is FeedsGetUserSuccessState ){
             return Scaffold(
               body: SingleChildScrollView(
                 child: Column(
                   children: [
                     Stack(
                       alignment: AlignmentDirectional.bottomCenter,
                       children: [
                         Card(
                           elevation: 8.0,
                           margin: EdgeInsets.all(8),
                           clipBehavior: Clip.antiAliasWithSaveLayer,
                           child: Image(
                             image: NetworkImage("${userModel.cover}"),
                             fit: BoxFit.cover,
                             height: 200.0,
                             width: double.infinity,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("Communicate with your friends",
                               style: Theme.of(context)
                                   .textTheme
                                   .bodyMedium
                                   ?.copyWith(color: Colors.lightBlue)),
                         ),
                       ],
                     ),
                     ListView.separated(
                         physics:const NeverScrollableScrollPhysics() ,
                         shrinkWrap: true,
                         itemBuilder: (context,index)=>buildPostItem(context,feedsCubit.posts[index],index),
                         separatorBuilder: (context,index)=>const SizedBox(height: 8,),
                         itemCount: feedsCubit.posts.length)
                   ],
                 ),
               ),
               floatingActionButton: FloatingActionButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPostScreen()));
                 },
                 child:  Icon(Icons.add_comment_rounded,color: Theme.of(context).scaffoldBackgroundColor,),
               ),
             );
           }
           else if (state is FeedsGetUserErrorState)
           {
             return const Center(child: Text("Check your internet connection"));}
           else {
             return const Center(child: CircularProgressIndicator());}
         },
    );
  }



  Widget buildPostItem(context,PostModel postModel,index)=>Card (
    elevation: 2.0,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        Row(
          children: [
             CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("${postModel.image}"),
              //child: Image(image: AssetImage("assets/images/6.jpg"),)
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${postModel.name}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 19),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 18,
                    )
                  ],
                ),
                Row(
                  children: [

                    Text("${postModel.dateTime}",
                      style: const TextStyle(
                          fontSize: 14, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
         Text("${postModel.text}",
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(height: 1.3, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 3,
            children: [
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Software_Engineering",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Mobile_Developer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

            ],
          ),
        ),
         if(postModel.postImage!='')
         Padding(
           padding: const EdgeInsets.only(top: 10),
           child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: NetworkImage("${postModel.postImage}"),
            ),
        ),
         ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children:  [
              const Icon(Icons.favorite_outline),
              Text("${FeedsCubit.get(context).likes[index]}"),
              const Spacer(),
              const Icon(Icons.comment),
              const Text("320 "),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

           
            Row(
              children: [

                InkWell(
                  onTap: (){
                    FeedsCubit.get(context).likePost(FeedsCubit.get(context).postsID[index]);
                  },
                  child: Row(
                    children: const[
                      Icon(Icons.favorite_outline),
                      Text("Like"),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: const[
                      Icon(Icons.add_comment_rounded),
                      Text("comment"),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: const[
                      Icon(Icons.ios_share_outlined),
                      Text("Share"),
                    ],
                  ),
                ),
              ],
            )

      ],
    ),
  );
}
