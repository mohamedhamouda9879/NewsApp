import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/layouts/home.dart';
import 'package:youngeyes/modules/login/cubit/cubit.dart';
import 'package:youngeyes/modules/login/cubit/states.dart';
import 'package:youngeyes/modules/register/register.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsLoginCubit(),
      child: BlocConsumer<NewsLoginCubit, NewsLoginStates>(
        listener: (context, state) {
          if (state is NewsLoginSucessStates) {
            if (state.NewsLoginModel.token != null) {
              print(state.NewsLoginModel.token);
              print(state.NewsLoginModel.toString());
              print(
                  'hamouda user f l login ${state.NewsLoginModel.user!.id.toString()}');
              CacheHelper.saveData(
                      key: 'userId',
                      value: state.NewsLoginModel.user!.id.toString())
                  .then((value) {
                print(
                    'hamouda user f l login gwa l function ${state.NewsLoginModel.user!.id.toString()}');
              });
              CacheHelper.saveData(
                      key: 'token', value: state.NewsLoginModel.token)
                  .then((value) {
                TOKEN = state.NewsLoginModel.token.toString();
                USERID = state.NewsLoginModel.user!.id.toString();
                NavigateAndFinish(context, HomeScreen());
              });

              showToast(
                  message: 'Successfully Login',
                  toastStates: ToastStates.SUCCESS);
            } else {
              print('hamouda');
              print(state.NewsLoginModel.token);
              showToast(
                  message: "Wrong Sign In", toastStates: ToastStates.EROOR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Sign in To Your Account',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: EmailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty)
                              return 'Please Enter Your Email';
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          lines: 1,
                          isPassword:
                              NewsLoginCubit.get(context).isPasswordShowen,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Password is Too Short';
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              NewsLoginCubit.get(context).UserLogin(
                                  email: EmailController.text,
                                  password: passwordController.text,
                                  context: context);
                            }
                          },
                          suffix: NewsLoginCubit.get(context).sufix,
                          suffixPressed: () {
                            NewsLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! NewsLoginLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                NewsLoginCubit.get(context).UserLogin(
                                  email: EmailController.text,
                                  password: passwordController.text,
                                  context: context,
                                );
                              }
                            },
                            text: 'Sign In',
                            radius: 12.0,
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have An Account?'),
                            defaultTextButton(
                                function: () {
                                  NavigateTo(context, RegisterScreen());
                                },
                                text: 'Sign Up')
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
