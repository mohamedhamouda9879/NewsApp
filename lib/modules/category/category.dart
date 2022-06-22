import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/category/cubit/cubit.dart';
import 'package:youngeyes/modules/category/cubit/states.dart';
import 'package:youngeyes/modules/news/news.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> items = [
    'https://whitecompressor.com/storage/images/one_o.jpeg',
    'https://whitecompressor.com/storage/images/two_o.jpeg',
    'https://whitecompressor.com/storage/images/three_o.jpeg',
    'https://whitecompressor.com/storage/images/four_o.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: ((context) => CategoryCubit()..getCategory(context)),
      child: BlocConsumer<CategoryCubit, CategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategorySuccessState) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height:
                          CategoryCubit.get(context).categoryModel.length * 260,
                      child: ConditionalBuilderRec(
                        condition:
                            CategoryCubit.get(context).categoryModel.isNotEmpty,
                        builder: (context) => AnimationLimiter(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                CategoryCubit.get(context).categoryModel.length,
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                  context,
                                  mq.width * 0.80,
                                  mq.height * 0.30,
                                  CategoryCubit.get(context)
                                      .categoryModel[index]
                                      .image,
                                  CategoryCubit.get(context)
                                      .categoryModel[index]
                                      .entitle,
                                  CategoryCubit.get(context)
                                      .categoryModel[index]
                                      .artitle, () {
                                NavigateTo(
                                    context,
                                    NewsScreen(CategoryCubit.get(context)
                                        .categoryModel[index]
                                        .id
                                        .toString()));
                              });
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                          ),
                        ),
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
                    ),
                    CarouselSlider(
                      items: items
                          .map((e) => Card(
                                shadowColor: defaultColor,
                                elevation: 12.0,
                                child: Center(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: e,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            SizedBox(
                                      width: mq.width * 0.25,
                                      height: mq.height * 0.25,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: defaultColor,
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.grey,
                                            highlightColor: defaultColor,
                                            child: Image.asset(
                                                'assets/images/logo.png')),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 6),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
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
