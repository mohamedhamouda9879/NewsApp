// ignore_for_file: avoid_print, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/modules/login/login.dart';
import 'package:youngeyes/modules/register/cubit/cubit.dart';
import 'package:youngeyes/modules/register/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey2 = GlobalKey<FormState>();
  String? compare;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsRegisterCubit(),
      child: BlocConsumer<NewsRegisterCubit, NewsRegisterStates>(
        listener: ((context, state) {
          if (state is NewsRegisterSuccessState) {
            if (state.registerModel.token != null) {
              print(state.registerModel.token);
              print(state.registerModel.toString());
              CacheHelper.saveData(
                  key: 'UserID',
                  value: state.registerModel.user!.id.toString());
              CacheHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then((value) {
                TOKEN = state.registerModel.token.toString();
                // USERID = state.loginModel.user!.id.toString();
                NavigateAndFinish(context, LoginScreen());
              });
              showToast(
                  message: 'Successfully Sign Up',
                  toastStates: ToastStates.SUCCESS);
            } else {
              print('hamouda');
              print(state.registerModel.token);
              showToast(
                  message: "Wrong Sign In", toastStates: ToastStates.EROOR);
            }
          }
        }),
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey2,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Sign up To Your Account',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your Name';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          suffix: NewsRegisterCubit.get(context).suffix,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is empty';
                            }
                            if (value.length < 7) {
                              return 'password is too short';
                            }
                            compare = value;
                            return null;
                          },
                          isPassword: NewsRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            NewsRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          lines: 1,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: rePasswordController,
                          suffix: NewsRegisterCubit.get(context).suffix,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            if (compare != value) {
                              return 'wrong password';
                            }
                            return null;
                          },
                          isPassword: NewsRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            NewsRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'RePassword',
                          lines: 1,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! NewsRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              print(nameController.text);
                              print(emailController.text);
                              print(passwordController.text);
                              print('ggg pass${rePasswordController.text}');
                              if (formKey2.currentState!.validate()) {
                                NewsRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  RePassword: rePasswordController.text,
                                  context: context,
                                );
                              }
                            },
                            text: 'Sign Up',
                            isUpperCase: true,
                            radius: 12.0,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Have An Account?'),
                            defaultTextButton(
                                function: () {
                                  NavigateTo(context, LoginScreen());
                                },
                                text: 'Sign in')
                          ],
                        ),
                      ],
                    ),
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
