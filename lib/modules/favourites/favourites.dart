import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          if (state is GetAllFavSuccessState){
            return SafeArea(
                child: Scaffold(
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
          }
          else {
            return Container();
          }

        },
      ),
    );
  }
}
