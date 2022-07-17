import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_application/cubits/registerCubit/cubit.dart';
import 'package:social_application/cubits/registerCubit/states.dart';
import 'package:social_application/network/cache_helper.dart';
import 'package:social_application/network/end_points.dart';
import 'package:social_application/screens/home_layout/homeLayout.dart';
import '../../network/end_points.dart';



class RegisterScreen extends StatefulWidget{

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey=GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

        return BlocProvider(create: (BuildContext context)=>RegisterCubit(),
          child:  BlocConsumer<RegisterCubit,RegisterStates>(
            listener: (context ,state){
              if(state is RegisterCreateUserSuccessState){
                CacheHelper.saveData(
                    key: "userID",
                    value: state.userID)
                    .then((value) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeLayout()), (route) => false);

                });
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeLayout()), (route) => false);
              }
              // if(state is! RegisterSuccessState){
              //   if (state is RegisterErrorState){
              //     Fluttertoast.showToast(
              //         msg: "unable to make registration",
              //         toastLength: Toast.LENGTH_LONG,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIosWeb: 2,
              //         backgroundColor: Colors.green,
              //         textColor: Colors.white,
              //         fontSize: 16.0
              //
              //     );
              //   }
              //   else{
              //     Fluttertoast.showToast(
              //         msg: "Register Successfully",
              //         toastLength: Toast.LENGTH_LONG,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIosWeb: 2,
              //         backgroundColor: Colors.green,
              //         textColor: Colors.white,
              //         fontSize: 16.0
              //
              //     );
              //   }
              // }
              },
            builder: (context,state){
              RegisterCubit registerCubit=RegisterCubit.get(context);
              return   Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 32)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Register now to communicate with your friends",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey, fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your name";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {},
                            obscureText: false,
                            decoration: InputDecoration(
                              label: const Text("Username"),
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your email address";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {},
                            obscureText: false,
                            decoration: InputDecoration(
                              label: const Text("Email Address"),
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password is too short";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              // if (formKey.currentState!.validate()) {
                              //   loginCubit.userLogin(
                              //       email: emailController.text,
                              //       password: passwordController.text);
                              // }
                            },
                            obscureText: registerCubit.isPassword,
                            decoration: InputDecoration(
                              label: const Text("Password"),
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    registerCubit.changePasswordIcon();
                                  },
                                  icon: registerCubit.icon),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "phone number is too short";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {

                            },

                            decoration: InputDecoration(
                              label: const Text("Phone"),
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40,),
                          state is! RegisterLoadingState
                              ? MaterialButton(
                            color: Colors.lightBlue,
                            height: 50.0,
                            minWidth: double.infinity,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                registerCubit.userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text
                                );


                              }
                            },
                            child: Text(
                              "Register",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 26),
                            ),
                          )
                              : const Center(child: CircularProgressIndicator()),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}