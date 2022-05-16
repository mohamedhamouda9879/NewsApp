// ignore_for_file: unnecessary_null_comparison

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/details/details.dart';
import 'package:youngeyes/modules/profile/cubit/cubit.dart';
import 'package:youngeyes/modules/profile/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class TopViewdScreen extends StatelessWidget {
  const TopViewdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopCubit()..getTopViewd(),
      child: BlocConsumer<TopCubit, TopViewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Y',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 25)),
                    Text('0',
                        style: GoogleFonts.abrilFatface(
                            color: Color.fromARGB(255, 17, 3, 137),
                            fontSize: 25)),
                    Text('UNG',
                        style: GoogleFonts.abrilFatface(
                            wordSpacing: 3, color: Colors.white, fontSize: 25)),
                    Text(' E',
                        style: GoogleFonts.abrilFatface(
                            color: Color.fromARGB(255, 17, 3, 137),
                            fontSize: 25)),
                    Text('YE',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 25)),
                    Text('S',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 25)),
                    EasyRichText(
                      "عيون شابة",
                      patternList: [
                        EasyRichTextPattern(
                            style: GoogleFonts.changa(
                                color: Color.fromARGB(255, 17, 3, 137),
                                fontSize: 16),
                            targetString: 'عيون شابة',
                            superScript: true),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: defaultColor,
            ),
            body: ConditionalBuilderRec(
              condition: TopCubit.get(context).topViewerDataModel != null,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) {
                    return TopViewItem(
                        topViewer:
                            TopCubit.get(context).topViewerDataModel[index],
                        context: context,
                        index: index,
                        function: () async {
                          NEWSID =
                              TopCubit.get(context).topViewer!.id.toString();
                          NavigateTo(
                              context,
                              NewsDetailsScreen(TopCubit.get(context)
                                  .topViewer!
                                  .id
                                  .toString()));
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: TopCubit.get(context).topViewerDataModel.length),
              fallback: (context) => Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: defaultColor,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: defaultColor,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => ProfileCubit()..getProfile(USERID!),
//       child: BlocConsumer<ProfileCubit, ProfileStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is ProfileSuccessState) {
//             return SafeArea(
//               child: Scaffold(
//                   body: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       padding: const EdgeInsets.all(12.0),
//                       width: mq.width * .99,
//                       height: mq.height * .25,
//                       child: Image.asset('assets/images/logo.png')),
//                   Container(
//                       alignment: Alignment.center,
//                       width: mq.width * 0.90,
//                       height: mq.height * .08,
//                       margin: const EdgeInsets.all(12.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 66, 66, 66),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           '${ProfileCubit.get(context).profileModel!.email}',
//                           style: const TextStyle(
//                               fontSize: 18.0, color: Colors.blue),
//                         ),
//                       )),
//                   Container(
//                       width: mq.width * 0.90,
//                       height: mq.height * .08,
//                       margin: const EdgeInsets.all(12.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 66, 66, 66),
//                         ),
//                       ),
//                       child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: defaultTextButton(
//                               function: () {}, text: 'Terms and Conditions'))),
//                   Container(
//                       width: mq.width * 0.90,
//                       height: mq.height * .08,
//                       margin: const EdgeInsets.all(12.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 66, 66, 66),
//                         ),
//                       ),
//                       child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: defaultTextButton(
//                               function: () {}, text: 'privacy policy'))),
//                 ],
//               )),
//             );
//           } else {
//             return Container(
//               child: Center(child: Text('fdfd')),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
