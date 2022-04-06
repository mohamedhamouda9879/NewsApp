// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/details/cubit/cubit.dart';
import 'package:youngeyes/modules/details/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  String? newId;

  NewsDetailsScreen(this.newId);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsDetailsCubit()..getNewsDetails(NEWSID),
      child: BlocConsumer<NewsDetailsCubit, NewsDetailsStates>(
        listener: (context, state) {
          if (state is NewsDetailsLoadingState) {
            print('hhhh');
          }
        },
        builder: (context, state) {
          print(NEWSID);
          print(
              'https://whitecompressor.com/storage/${NewsDetailsCubit.get(context).newsDetailsModel?.image.toString()}');
          if (state is NewsDetailsSuccessState || state is AddFavSuccessState) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.comment),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return const ModalBottomSheet();
                        });
                  },
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 12.0,
                          child: Container(
                            height: 300,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 8.0),
                            child: NewsDetailsCubit.get(context)
                                        .newsDetailsModel
                                        ?.image
                                        .toString() !=
                                    null
                                ? Container(
                                    padding: const EdgeInsets.all(3.0),
                                    width: MediaQuery.of(context).size.width,
                                    child: CachedNetworkImage(
                                      height: 180,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://whitecompressor.com/storage/${NewsDetailsCubit.get(context).newsDetailsModel?.image.toString()}',
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey,
                                            highlightColor: defaultColor,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey,
                                              highlightColor: defaultColor,
                                              child: Image.asset(
                                                  'assets/images/logo.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )
                                // ? Image.network(
                                //     'https://whitecompressor.com/storage/${NewsDetailsCubit.get(context).newsDetailsModel?.image.toString()}',
                                //   )
                                : Image.asset('assets/images/placeholder.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            print('hamouda bos $NEWSID');
                            print('hamouda bos user rkmo $USERID');
                            NewsDetailsCubit.get(context)
                                .addFav(NEWSID, USERID!);
                            NewsDetailsCubit.get(context).changeFavVisibility();
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                NewsDetailsCubit.get(context).sufix,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: Text(
                              NewsDetailsCubit.get(context)
                                  .newsDetailsModel!
                                  .title
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            margin: const EdgeInsets.all(12.0),
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              NewsDetailsCubit.get(context)
                                  .newsDetailsModel!
                                  .content
                                  .toString(),
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
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

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    return BlocProvider(
      create: (context) => NewsDetailsCubit()..getComments(NEWSID),
      child: BlocConsumer<NewsDetailsCubit, NewsDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 400.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: TextFormField(
                            controller: commentController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your Comment'),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            NewsDetailsCubit.get(context).addComment(
                                NEWSID, USERID!, commentController.text);
                            print(commentController.text);
                            commentController.clear();
                          },
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 300,
                      child: ConditionalBuilderRec(
                        condition: NewsDetailsCubit.get(context)
                                .getCommentsModel!
                                .resultUser !=
                            null,
                        builder: (context) => AnimationLimiter(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemCount: NewsDetailsCubit.get(context)
                                .getCommentsModel!
                                .resultUser!
                                .length,
                            itemBuilder: (context, index) {
                              print('helolololol');
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: CommentItem(
                                        NewsDetailsCubit.get(context)
                                            .getCommentsModel!
                                            .resultUser![index]
                                            .content
                                            .toString(),
                                        context,
                                        NewsDetailsCubit.get(context)
                                            .getCommentsModel!
                                            .resultUser![index]
                                            .user!
                                            .email
                                            .toString()),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                          ),
                        ),
                        fallback: (context) => SizedBox(
                          width: 150.0,
                          height: 100.0,
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.amber,
                              child: Image.asset('assets/images/logo.png')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
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
            );
          }
        },
      ),
    );
  }
}
