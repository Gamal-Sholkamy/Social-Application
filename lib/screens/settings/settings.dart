import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/editProfileCubit/cubit.dart';
import 'package:social_application/cubits/editProfileCubit/states.dart';
import 'package:social_application/cubits/homeLayoutCubit/cubit.dart';
import 'package:social_application/cubits/homeLayoutCubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/screens/edit_profile/editProfile.dart';


class SettingsScreen extends StatelessWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit,EditProfileStates>(
        listener: (context,state){},
        builder: (context,state){
          final UserModel model=EditProfileCubit.get(context).userModel!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 160,
                          decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            image: DecorationImage(
                                image:NetworkImage("${model.cover}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child:  CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage("${model.image}"),
                          //child: Image(image: AssetImage("assets/images/6.jpg"),)
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,),
                Text(
                  "${model.name}",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),
                Text(
                  "${model.bio}",style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 18),),
                const SizedBox(
                  height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(

                        child: Column(
                          children: [
                            Text(
                              "140",style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16),),
                            Text(
                              "Posts",style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16),),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(

                        child: Column(
                          children: [
                            Text(
                              "18",style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16),),
                            Text(
                              "Photos",style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16),),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(

                        child: Column(
                          children: [
                            Text(
                              "684",style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16),),
                            Text(
                              "Friends",style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16),),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(

                        child: Column(
                          children: [
                            Text(
                              "10254",style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16),),
                            Text(
                              "Followers",style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16),),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: OutlinedButton(
                      onPressed: (){},
                      child: Text(
                        "Add Photo",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor),), ),),
                    const SizedBox(width: 10,),
                    OutlinedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                      },
                      child: const Icon(Icons.mode_edit_outlined)),
                  ],
                ),



              ],

            ),
          );
        },

    );
  }
}