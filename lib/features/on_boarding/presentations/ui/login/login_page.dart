import 'package:ecommerce_application/features/dashboard/dashboard.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/app_rounded_button.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCreatingAccount = false;
  bool isPasswordVisible = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
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
                  borderRadius: BorderRadius.circular(
                    20,
                  ), //color:Colors.white.withOpacity(0.5),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.blue.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///Emails Field
                      TextFormField(
                        validator: (value) {
                          final bool emailRegex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value ?? "");

                          if (value == null || value.isEmpty) {
                            return "please enter your email";
                          } else if (!emailRegex) {
                            return "please enter valid email";
                          } else {
                            return null;
                          }
                        },

                        controller: emailController,
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

                      ///Passwords fields
                      TextFormField(
                        validator: (value) {
                          final bool passwordValid = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          ).hasMatch(value ?? "");

                          if (value == null || value.isEmpty) {
                            return "please enter your password";
                          } else if (!passwordValid) {
                            return "please enter valid password";
                          } else {
                            return null;
                          }
                        },

                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Enter your password here",
                          hintStyle: TextStyle(/*color: Colors.white*/),
                          labelText: "Password",
                          labelStyle: TextStyle(/*color: Colors.white*/),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 11),

                      BlocConsumer<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is UserLoadingState) {
                            setState(() {
                              isCreatingAccount = true;
                            });
                          }

                          if (state is UserFailureState) {
                            setState(() {
                              isCreatingAccount = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMsg),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }

                          if (state is UserSuccessState) {
                            setState(() {
                              isCreatingAccount = false;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  " Your are SuccessFully loggedIn! ",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashBoard(),
                              ),
                            );
                          }
                        },

                        builder: (_, state) {
                          return AppRoundedButton(
                            onTap: isCreatingAccount
                                ? null
                                : () {
                                    if (formkey.currentState!.validate()) {
                                       context.read<UserBloc>().add(UserAuthenticateEvent(
                                           email: emailController.text.trim(),
                                           pass: passwordController.text.trim())
                                       );
                                    }
                                  },
                            title:"Log In",
                            bgColor: Colors.amber,
                          );
                        },
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "if not registered ",
                              style: TextStyle(color: Colors.white),
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Create Now",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
