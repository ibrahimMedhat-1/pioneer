import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer/view_model/auth_cubit/auth_cubit.dart';

import '../home/home.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: const Image(image: AssetImage('assits/pioneer.jpg')),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (String value) {},
                        onChanged: (String value) {},
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            hintText: 'Enter the email',
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your password';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        // obscureText: cubit.obscure,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            hintText: 'Enter the Password',
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     // cubit.changeObscure();
                            //   },
                            //   icon: cubit.obscure
                            //       ? Icon(
                            //     Icons.remove_red_eye,
                            //     color: Colors.blue,
                            //   )
                            //       : Icon(
                            //     Icons.visibility_off_sharp,
                            //     color: Colors.blue,
                            //   ),
                            // ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      cubit.isLoading == false
                          ? Container(
                              width: 180.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                child: const Text(style: TextStyle(color: Colors.white, fontSize: 17.5, fontWeight: FontWeight.bold), 'LOGIN'),
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
