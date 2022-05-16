// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/models/news/newsmodel.dart';
import 'package:youngeyes/modules/details/details.dart';
import 'package:youngeyes/modules/news/cubit/cubit.dart';
import 'package:youngeyes/modules/news/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class NewsScreen extends StatelessWidget {
  String catName;
  NewsScreen(this.catName, {Key? key}) : super(key: key);
  AllNews? allNews;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()..getNewsForCategory(catName)),
        // BlocProvider(
        // create: (context) => NewsDetailsCubit()..getNewsDetails(catName)),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewsSuccessState) {
            return SafeArea(
                child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Y',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 35)),
                    Text('0',
                        style: GoogleFonts.abrilFatface(
                            color: Color.fromARGB(255, 17, 3, 137),
                            fontSize: 35)),
                    Text('UNG',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 35)),
                    Text(' E',
                        style: GoogleFonts.abrilFatface(
                            color: Color.fromARGB(255, 17, 3, 137),
                            fontSize: 35)),
                    Text('YE',
                        style: GoogleFonts.abrilFatface(
                            color: Colors.white, fontSize: 35)),
                    Text('S',
                        style: GoogleFonts.abrilFatface(
                            color: Color.fromARGB(255, 17, 3, 137),
                            fontSize: 35)),
                  ],
                )),
                backgroundColor: Colors.amber,
              ),
              body: ConditionalBuilderRec(
                condition: NewsCubit.get(context).allNews != null,
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) {
                      return NewsItem(
                          allNews: NewsCubit.get(context).allNews!,
                          context: context,
                          index: index,
                          function: () async {
                            NEWSID = NewsCubit.get(context)
                                .allNews!
                                .post![index]
                                .id
                                .toString();
                            NavigateTo(
                                context,
                                NewsDetailsScreen(NewsCubit.get(context)
                                    .allNews!
                                    .id
                                    .toString()));
                          });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 4,
                      );
                    },
                    itemCount: NewsCubit.get(context).allNews!.post!.length),
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
          } else {
            return Scaffold(
              body: Center(
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
            );
          }
        },
      ),
    );
  }
}
