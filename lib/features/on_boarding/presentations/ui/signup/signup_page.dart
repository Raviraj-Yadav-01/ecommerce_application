
import 'package:ecommerce_application/core/widgets/app_rounded_button.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_state.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isCreatingAccount = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  GlobalKey <FormState> formkey = GlobalKey<FormState>();

 @override
  void dispose(){
   nameController.dispose();
   emailController.dispose();
   numberController.dispose();
   passwordController.dispose();
   confirmPasswordController.dispose();
   super.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key : formkey,
        child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
            image: AssetImage("assets/images/Article_e-com_sep-1.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.blue.withOpacity(0.5),
                  ],
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      //name field
                      TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your name";
                          }else{
                            return null;
                          }
                        },
                        controller:nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Enter your name here",
                          hintStyle: TextStyle(),
                          labelText: "Name",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      ),

                      SizedBox(height: 11),

                      //email field
                      TextFormField(
                        validator: (value){
                          final bool emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "");

                          if (value == null || value.isEmpty) {
                            return "please enter your email";
                          } else if (!emailRegex) {
                            return "please enter valid email";
                          } else {
                            return null;
                          }
                        },

                        controller:emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email here",
                          hintStyle: TextStyle(),
                          labelText: "Email",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      ),

                      SizedBox(height: 11),
                      // mobile number
                      TextFormField(

                        validator: (value){

                          if(value == null || value.isEmpty){
                            return "please enter mobile number";
                          }
                          if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                            return "please 10 digit mobile number";
                          }
                          return null;
                        },
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter your mobile no here",
                          hintStyle: TextStyle(),
                          labelText: "mobile number",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      ),

                      SizedBox(height: 11),


                      //password
                      TextFormField(
                            validator:(value){

                              final bool passwordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value ?? "");

                              if(value == null || value.isEmpty){
                                return "please enter your password";
                              }else if(!passwordValid){
                                return "please enter valid password";
                              }else {
                                return null;
                              }

                            },

                            controller:passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Enter your password here",
                              hintStyle: TextStyle(/*color: Colors.white*/),
                              labelText: "password",
                              labelStyle: TextStyle(/*color: Colors.white*/),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              suffixIcon: IconButton(
                                icon:Icon( isPasswordVisible ? Icons.visibility : Icons.visibility_off,),
                                onPressed:(){
                                 setState((){
                                   isPasswordVisible = !isPasswordVisible;
                                 });
                                }
                              )
                            ),
                          ),

                      SizedBox(height: 11),

                      //Confirm Password
                      TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please retype your password";
                                } else if (passwordController.text != value) {
                                  return "password doesn't match ";
                                } else {
                                  return null;
                                }
                              },
                            controller:confirmPasswordController,
                             obscureText: !isPasswordVisible,
                             decoration: InputDecoration(
                              hintText: "Enter your ConfirmPassword here...",
                              hintStyle: TextStyle(),
                              labelText: "ConfirmPassword",
                              labelStyle: TextStyle(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                 ),onPressed: () {
                                 setState(() {
                                   isConfirmPasswordVisible = !isPasswordVisible;
                                 });
                               },
                               )
                            ),
                          ),

                      SizedBox(height: 11),

                      ///ElevatedButton
                      BlocConsumer<UserBloc, UserState>(

                          listener:(context, state){

                            if(state is UserLoadingState){
                              setState((){isCreatingAccount = true;});

                            }

                            if(state is UserFailureState){
                              setState((){isCreatingAccount = false;});
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.errorMsg),backgroundColor: Colors.red,));
                            }

                            if(state is UserSuccessState){
                              setState((){isCreatingAccount = false;});

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Account create SuccessFully!!"),backgroundColor: Colors.green,));

                              Navigator.pushReplacementNamed(context, AppRoutes.login);
                            }

                          },

                          builder: (_,state) {
                            return AppRoundedButton(

                                onTap: isCreatingAccount ? null : () {

                                  if (formkey.currentState!.validate()) {
                                    context.read<UserBloc>().add(UserRegisterEvent(
                                        name: nameController.text,
                                        mobNo: numberController.text,
                                        email: emailController.text,
                                        pass: passwordController.text
                                    )
                                    );
                                  }
                                },
                                title: isCreatingAccount ? "Creating Account..." : "Signup", bgColor: Colors.amber

                            );
                          },
                      ),

                      ///user Msg
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("if already have an account",
                              style: TextStyle(color: Colors.white),
                            ),

                            SizedBox(width: 5),

                            Text("Login Now",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
      )
    );
  }
}