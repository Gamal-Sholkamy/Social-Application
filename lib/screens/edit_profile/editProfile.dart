
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/cubits/editProfileCubit/cubit.dart';
import 'package:social_application/cubits/editProfileCubit/states.dart';
import 'package:social_application/models/user_model.dart';

class EditProfileScreen extends StatelessWidget{
   EditProfileScreen({Key? key}) : super(key: key);
  final _nameController=TextEditingController();
   final _bioController=TextEditingController();
   final _phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context )=>EditProfileCubit()..getUserProfileData(),
    child: BlocConsumer<EditProfileCubit,EditProfileStates>(
      listener: (context,state){},
      builder: (context,state){
        final EditProfileCubit editProfileCubit=EditProfileCubit.get(context);
        UserModel model=editProfileCubit.userModel!;
        var profileImage=editProfileCubit.profileImage;
        var coverImage=editProfileCubit.coverImage;
        _nameController.text=editProfileCubit.userModel!.name!;
        _phoneController.text=editProfileCubit.userModel!.phone!;
        _bioController.text=editProfileCubit.userModel!.bio!;

        return Scaffold(
          appBar: AppBar(
            title: Text("Edit Profile",style: Theme.of(context).textTheme.bodyText1,),
            actions: [
              TextButton(
                  onPressed: (){
                    editProfileCubit.updateUser(name: _nameController.text, phone: _phoneController.text, bio: _bioController.text);
                  },
                  child: Text("Update",style:Theme.of(context).textTheme.bodyMedium ,) ),
              const SizedBox(width: 10,)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is EditProfileUpdateUserLoadingState)
                    const LinearProgressIndicator(),
                  if(state is EditProfileUpdateUserLoadingState)
                    const SizedBox(height: 10,),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                      image:NetworkImage("${model?.cover}"),
                                      //coverImage==null? NetworkImage("${model?.cover}"): FileImage(coverImage),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    editProfileCubit.getCoverImage();
                                  },
                                  icon: const CircleAvatar(
                                      radius: 20,
                                      child:  Icon(Icons.camera_enhance_rounded,size: 16,))),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 42,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child:  CircleAvatar(
                                radius: 40,
                                backgroundImage:NetworkImage("${model?.image}"),
                                //profileImage ==null ?NetworkImage("${model?.image}"):FileImage(profileImage),

                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  editProfileCubit.getProfileImage();
                                },
                                icon: const CircleAvatar(
                                    radius: 20,
                                    child:  Icon(Icons.camera_enhance_rounded,size: 16,))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if(editProfileCubit.profileImage !=null || editProfileCubit.coverImage !=null)
                    Row(
                      children: [
                        if(editProfileCubit.profileImage !=null)
                          Expanded(
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: (){
                                      editProfileCubit.uploadProfileImage(name: _nameController.text, phone: _phoneController.text, bio: _bioController.text);
                                    }, child: const Text("UPLOAD PROFILE")),
                                const SizedBox(
                                  height: 5,),
                                const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                        if(editProfileCubit.coverImage !=null)
                          Expanded(
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: (){
                                      editProfileCubit.uploadCoverImage(name: _nameController.text, phone: _phoneController.text, bio: _bioController.text);

                                    }, child: const Text("UPLOAD COVER")),
                                const SizedBox(
                                  height: 5,),
                                const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if(editProfileCubit.profileImage !=null || editProfileCubit.coverImage !=null)
                    const SizedBox(height: 20,),
                  const SizedBox(
                    height: 10,),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Name can/'t be empty";
                      }
                      else {
                        return null;}
                    },
                    decoration: InputDecoration(
                      label: const Text("Name"),
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Phone can/'t be empty";
                      }
                      else {
                        return null;}
                    },
                    decoration: InputDecoration(
                      label: const Text("Phone"),
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,),
                  TextFormField(
                    controller: _bioController,
                    keyboardType: TextInputType.text,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Bio can/'t be empty";
                      }
                      else {
                        return null;}
                    },
                    decoration: InputDecoration(
                      label: const Text("Bio"),
                      prefixIcon: const Icon(Icons.insert_drive_file_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
    );

  }

}