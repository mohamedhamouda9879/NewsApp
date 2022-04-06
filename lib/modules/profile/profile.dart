import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/modules/profile/cubit/cubit.dart';
import 'package:youngeyes/modules/profile/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(USERID!),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileSuccessState) {
            return SafeArea(
              child: Scaffold(
                  body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      width: mq.width * .99,
                      height: mq.height * .25,
                      child: Image.asset('assets/images/logo.png')),
                  Container(
                      alignment: Alignment.center,
                      width: mq.width * 0.90,
                      height: mq.height * .08,
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 66, 66, 66),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${ProfileCubit.get(context).profileModel!.email}',
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.blue),
                        ),
                      )),
                  Container(
                      width: mq.width * 0.90,
                      height: mq.height * .08,
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 66, 66, 66),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: defaultTextButton(
                              function: () {}, text: 'Terms and Conditions'))),
                  Container(
                      width: mq.width * 0.90,
                      height: mq.height * .08,
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 66, 66, 66),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: defaultTextButton(
                              function: () {}, text: 'privacy policy'))),
                ],
              )),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
