import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_application/cubits/newPostCubit/cubit.dart';
import 'package:social_application/cubits/newPostCubit/states.dart';
import 'package:social_application/models/user_model.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) =>
    CreatePostCubit()
      ..getUserDataToPost(),
        child: BlocConsumer<CreatePostCubit, CreatePostStates>(
        listener: (context, state)
    {},
    builder: (context,state) {
      final CreatePostCubit newPostCubit = CreatePostCubit.get(context);
      UserModel model = newPostCubit.userModel!;
      //    if (state is CreatePostGetUserSuccessState){
      //      return Scaffold(
      //        appBar: AppBar(
      //          title:  Text("Create Post",style: Theme.of(context).textTheme.bodyText1,),
      //          actions: [
      //            TextButton(
      //                onPressed: (){
      //                  if (newPostCubit.postImage==null){
      //                    newPostCubit.createPost(dateTime: DateTime.now().toString(), text: textController.text);
      //                  }
      //                  else{
      //                    newPostCubit.uploadPostImage(dateTime: DateTime.now().toString(), text: textController.text);
      //                  }
      //                },
      //                child: Text("POST",style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor) ,) ),
      //            const SizedBox(width: 10,)
      //          ],
      //
      //        ),
      //        body: Padding(
      //          padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //          child: Column(
      //            children: [
      //              Row(
      //                children: [
      //                  CircleAvatar(
      //                    radius: 30,
      //                    backgroundImage: NetworkImage("${model.image}"),
      //                    //child: Image(image: AssetImage("assets/images/6.jpg"),)
      //                  ),
      //                  const SizedBox(
      //                    width: 12,
      //                  ),
      //                  Column(
      //                    crossAxisAlignment: CrossAxisAlignment.start,
      //                    children: [
      //                      Text(
      //                        "${model.name}", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 19),
      //                      ),
      //
      //                    ],
      //                  ),
      //                  const Spacer()
      //                ],
      //              ),
      //              const SizedBox(
      //                height: 10,
      //              ),
      //              Expanded(
      //                child: TextFormField(
      //                  controller: textController,
      //                  decoration: InputDecoration(
      //                    hintText: "What is in your mind ${model.name}",
      //                    border: InputBorder.none,
      //                  ),
      //                ),
      //
      //              ),
      //              const SizedBox(
      //                height: 10,
      //              ),
      //              if(newPostCubit.postImage!=null)
      //                Stack(
      //                  alignment: AlignmentDirectional.topEnd,
      //                  children: [
      //                    Container(
      //                      width: double.infinity,
      //                      height: 160,
      //                      decoration:  BoxDecoration(
      //                        borderRadius:  BorderRadius.circular(
      //                            5
      //                        ),
      //                        image: DecorationImage(
      //                            image:FileImage(newPostCubit.postImage!),
      //                            //coverImage==null? NetworkImage("${model?.cover}"): FileImage(coverImage),
      //                            fit: BoxFit.cover),
      //                      ),
      //                    ),
      //                    IconButton(
      //                        onPressed: (){
      //                          newPostCubit.removePostImage();
      //                        },
      //                        icon: const CircleAvatar(
      //                            radius: 20,
      //                            child:  Icon(Icons.close,size: 16,))),
      //                  ],
      //                ),
      //              Row(
      //                children: [
      //                  Expanded(
      //                    child: OutlinedButton(
      //                      onPressed: (){
      //                        newPostCubit.getPostImage();
      //                      },
      //                      child: Row(
      //                        mainAxisAlignment: MainAxisAlignment.center,
      //                        children: const [
      //                          Icon(Icons.add_photo_alternate_outlined),
      //                          SizedBox(width: 5,),
      //                          Text("Add a Photo"),
      //                        ],
      //                      ),
      //                    ),
      //                  ),
      //                  const SizedBox(width: 8,),
      //                  Expanded(
      //                    child: OutlinedButton(
      //                      onPressed: (){},
      //                      child: Row(
      //                        mainAxisAlignment: MainAxisAlignment.center,
      //                        children: const [
      //                          Icon(Icons.tag_outlined),
      //                          SizedBox(width: 5,),
      //                          Text("Add a Tags"),
      //                        ],
      //                      ),
      //                    ),
      //                  ),
      //                ],
      //              ),
      //              const SizedBox(
      //                height: 10,
      //              ),
      //            ],),
      //        ),
      //      );
      //    }
      //
      //   else if (state is CreatePostGetUserErrorState){
      //     return Scaffold(
      //       appBar: AppBar(),
      //       body: const Center(child: Text("Make sure you have an internet connection"),),
      //     );
      //   }
      //   else {
      //     return Scaffold(
      //       appBar: AppBar(),
      //       body: const Center(child: CircularProgressIndicator()),
      //     );
      //   }
      //
      // },
      return Scaffold(
        appBar: AppBar(
          title: Text("Create Post", style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          actions: [
            TextButton(
                onPressed: () {
                  if (newPostCubit.postImage == null) {
                    newPostCubit.createPost(dateTime: DateTime.now().toString(),
                        text: textController.text);
                  }
                  else {
                    newPostCubit.uploadPostImage(
                        dateTime: DateTime.now().toString(),
                        text: textController.text);
                  }
                },
                child: Text("POST", style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme
                    .of(context)
                    .primaryColor),)),
            const SizedBox(width: 10,)
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("${model.image}"),
                    //child: Image(image: AssetImage("assets/images/6.jpg"),)
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${model.name}", style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 19),
                      ),

                    ],
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "What is in your mind ${model.name}",
                    border: InputBorder.none,
                  ),
                ),

              ),
              const SizedBox(
                height: 10,
              ),
              if(newPostCubit.postImage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5
                        ),
                        image: DecorationImage(
                            image: FileImage(newPostCubit.postImage!),
                            //coverImage==null? NetworkImage("${model?.cover}"): FileImage(coverImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          newPostCubit.removePostImage();
                        },
                        icon: const CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.close, size: 16,))),
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        newPostCubit.getPostImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_photo_alternate_outlined),
                          SizedBox(width: 5,),
                          Text("Add a Photo"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.tag_outlined),
                          SizedBox(width: 5,),
                          Text("Add a Tags"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],),
        ),
      );
    }),
    );
    }
  }