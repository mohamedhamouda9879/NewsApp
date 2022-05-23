import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/details/details.dart';
import 'package:youngeyes/modules/favourites/cubit/cubit.dart';
import 'package:youngeyes/modules/favourites/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetAllFavCubit()..getAllFav(USERID!)),
      ],
      child: BlocConsumer<GetAllFavCubit, GetAllFavStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            // appBar: AppBar(
            //   elevation: 0,
            //   title: Center(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text('Y',
            //             style: GoogleFonts.abrilFatface(
            //                 color: Colors.white, fontSize: 25)),
            //         Text('0',
            //             style: GoogleFonts.abrilFatface(
            //                 color: Color.fromARGB(255, 17, 3, 137),
            //                 fontSize: 25)),
            //         Text('UNG',
            //             style: GoogleFonts.abrilFatface(
            //                 wordSpacing: 3, color: Colors.white, fontSize: 25)),
            //         Text(' E',
            //             style: GoogleFonts.abrilFatface(
            //                 color: Color.fromARGB(255, 17, 3, 137),
            //                 fontSize: 25)),
            //         Text('YE',
            //             style: GoogleFonts.abrilFatface(
            //                 color: Colors.white, fontSize: 25)),
            //         Text('S',
            //             style: GoogleFonts.abrilFatface(
            //                 color: Colors.white, fontSize: 25)),
            //         EasyRichText(
            //           "عيون شابة",
            //           patternList: [
            //             EasyRichTextPattern(
            //                 style: GoogleFonts.changa(
            //                     color: Color.fromARGB(255, 17, 3, 137),
            //                     fontSize: 16),
            //                 targetString: 'عيون شابة',
            //                 superScript: true),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            //   backgroundColor: defaultColor,
            // ),
            body: ConditionalBuilderRec(
              condition: state is GetAllFavSuccessState,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItemFav(
                        getAllFavouriteModel:
                            GetAllFavCubit.get(context).getAllFavouriteModel!,
                        context: context,
                        index: index,
                        function: () async {
                          NEWSID = GetAllFavCubit.get(context)
                              .getAllFavouriteModel!
                              .favourites![index]
                              .postId
                              .toString();

                          NavigateTo(
                              context,
                              NewsDetailsScreen(GetAllFavCubit.get(context)
                                  .getAllFavouriteModel!
                                  .favourites![index]
                                  .postId
                                  .toString()));
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: GetAllFavCubit.get(context)
                      .getAllFavouriteModel!
                      .favourites!
                      .length),
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
